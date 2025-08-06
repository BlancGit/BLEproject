/* main.c - Application main entry point */

/*
 * Copyright (c) 2024 Nordic Semiconductor ASA
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr/types.h>
#include <stddef.h>
#include <string.h>
#include <errno.h>
#include <zephyr/sys/printk.h>
#include <zephyr/sys/byteorder.h>
#include <zephyr/kernel.h>

#include <zephyr/bluetooth/bluetooth.h>
#include <zephyr/bluetooth/hci.h>
#include <zephyr/bluetooth/conn.h>
#include <zephyr/bluetooth/uuid.h>
#include <zephyr/bluetooth/gatt.h>
#include <zephyr/bluetooth/services/bas.h>
#include <zephyr/bluetooth/services/hrs.h>

#include "tfm_ns_interface.h"
#ifdef TFM_PSA_API
#include "psa_manifest/sid.h"
#include "psa/crypto.h"
#endif

static bool hrf_ntf_enabled;

static const struct bt_data ad[] = {
    BT_DATA_BYTES(BT_DATA_FLAGS, (BT_LE_AD_GENERAL | BT_LE_AD_NO_BREDR)),
    BT_DATA_BYTES(BT_DATA_UUID16_ALL,
                  BT_UUID_16_ENCODE(BT_UUID_HRS_VAL),
                  BT_UUID_16_ENCODE(BT_UUID_BAS_VAL)),
};

static const struct bt_data sd[] = {
    BT_DATA(BT_DATA_NAME_COMPLETE, CONFIG_BT_DEVICE_NAME, sizeof(CONFIG_BT_DEVICE_NAME) - 1),
};

static void start_adv(void)
{
    int err = bt_le_adv_start(BT_LE_ADV_CONN_FAST_1, ad, ARRAY_SIZE(ad), sd, ARRAY_SIZE(sd));
    if (err) {
        printk("Advertising failed to start (err %d)\n", err);
    } else {
        printk("Advertising successfully started\n");
    }
}

static void connected(struct bt_conn *conn, uint8_t err)
{
    char addr[BT_ADDR_LE_STR_LEN];
    bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

    if (err) {
        printk("Failed to connect to %s %u %s\n", addr, err, bt_hci_err_to_str(err));
        return;
    }

    printk("Connected to %s\n", addr);
    
    if (bt_conn_set_security(conn, BT_SECURITY_L4)) {
        printk("Failed to set security\n");
    }
}

static void disconnected(struct bt_conn *conn, uint8_t reason)
{
    char addr[BT_ADDR_LE_STR_LEN];
    bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

    printk("Disconnected from %s, reason 0x%02x %s\n", addr, reason, bt_hci_err_to_str(reason));
    start_adv();
}

static void security_changed(struct bt_conn *conn, bt_security_t level, enum bt_security_err err)
{
    char addr[BT_ADDR_LE_STR_LEN];
    bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

    if (!err) {
        printk("Security changed: %s level %u\n", addr, level);
    } else {
        printk("Security failed: %s level %u err %s(%d)\n", addr, level, bt_security_err_to_str(err), err);
    }
}

BT_CONN_CB_DEFINE(conn_callbacks) = {
    .connected = connected,
    .disconnected = disconnected,
    .security_changed = security_changed,
};

static void auth_passkey_display(struct bt_conn *conn, unsigned int passkey)
{
    char addr[BT_ADDR_LE_STR_LEN];
    bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));
    printk("Passkey for %s: %06u\n", addr, passkey);
}

static void auth_cancel(struct bt_conn *conn)
{
    char addr[BT_ADDR_LE_STR_LEN];
    bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));
    printk("Pairing cancelled: %s\n", addr);
}

static void pairing_complete(struct bt_conn *conn, bool bonded)
{
    printk("Pairing Complete\n");
}

static void pairing_failed(struct bt_conn *conn, enum bt_security_err reason)
{
    printk("Pairing Failed (%d). Disconnecting.\n", reason);
    bt_conn_disconnect(conn, BT_HCI_ERR_AUTH_FAIL);
}

static struct bt_conn_auth_cb auth_cb_display = {
    .passkey_display = auth_passkey_display,
    .cancel = auth_cancel,
};

static struct bt_conn_auth_info_cb auth_cb_info = {
    .pairing_complete = pairing_complete,
    .pairing_failed = pairing_failed,
};

static void hrs_ntf_changed(bool enabled)
{
    hrf_ntf_enabled = enabled;
    printk("HRS notification status changed: %s\n", enabled ? "enabled" : "disabled");
}

static struct bt_hrs_cb hrs_cb = {
    .ntf_changed = hrs_ntf_changed,
};

static void bas_notify(void)
{
    uint8_t battery_level = bt_bas_get_battery_level();
    battery_level = (battery_level == 0) ? 100U : battery_level - 1;
    bt_bas_set_battery_level(battery_level);
}

static void hrs_notify(void)
{
    static uint8_t heartrate = 90U;
    heartrate = (heartrate >= 160U) ? 90U : heartrate + 1;
    if (hrf_ntf_enabled) {
        bt_hrs_notify(heartrate);
    }
}

static void tfm_get_version(void)
{
    uint32_t version = psa_framework_version();
    printk("PSA Framework API Version: %d\n", version);
}

#ifdef TFM_PSA_API
static void tfm_get_sid(void)
{
    uint32_t version = psa_version(TFM_CRYPTO_SID);
    printk("PSA Crypto service minor version: %d\n", version);
}

static void tfm_psa_crypto_rng(void)
{
    psa_status_t status;
    uint8_t outbuf[16] = {0};
    status = psa_generate_random(outbuf, sizeof(outbuf));
    printk("Generated random data:\n");
    for (int i = 0; i < sizeof(outbuf); i++) {
        printk("%02X ", outbuf[i]);
    }
    printk("\n");
}
#endif

int main(void)
{
    int err = bt_enable(NULL);
    if (err) {
        printk("Bluetooth init failed (err %d)\n", err);
        return 0;
    }
    att_test();
    printk("Bluetooth initializedddddddd\n");
    bt_conn_auth_cb_register(&auth_cb_display);
    bt_conn_auth_info_cb_register(&auth_cb_info);
    bt_hrs_cb_register(&hrs_cb);
    start_adv();

    printk("Checking TF-M now...\n");
    tfm_get_version();
#ifdef TFM_PSA_API
    tfm_get_sid();
    tfm_psa_crypto_rng();
#endif

    while (1) {
        k_sleep(K_SECONDS(1));
        hrs_notify();
        bas_notify();
    }
    return 0;
}