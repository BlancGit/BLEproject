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
#include <zephyr/bluetooth/services/nus.h>

#include "tfm_ns_interface.h"
#ifdef TFM_PSA_API
#include "psa_manifest/sid.h"
#include "psa/crypto.h"
#endif

#include "psa_attestation.h"

#define CHUNK_SIZE       16    // Initial received data size (16 bytes)
#define DUPLICATED_SIZE  64    // Duplicated data size (64 bytes)
#define NOTIF_CHUNK_SIZE 20    // Max notification chunk size

static bool nus_ntf_enabled;

static const struct bt_data ad[] = {
    BT_DATA_BYTES(BT_DATA_FLAGS, (BT_LE_AD_GENERAL | BT_LE_AD_NO_BREDR)),
    BT_DATA_BYTES(BT_DATA_UUID128_ALL, BT_UUID_NUS_SRV_VAL),
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

// NUS notification callback
static void nus_notif_enabled(bool enabled, void *ctx)
{
    ARG_UNUSED(ctx);
    nus_ntf_enabled = enabled;
    printk("sNUS notification status changed: %s\n", enabled ? "enabled" : "disabled");
}

// Main NUS data handler with debugging
static void nus_received(struct bt_conn *conn, const void *data, uint16_t len, void *ctx)
{
    char addr[BT_ADDR_LE_STR_LEN];
    bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

    printk("*** CHALLENGE FROM %s ***\n", addr);
    printk("Raw challenge (%d bytes): ", len);
    for (int i = 0; i < len; i++) {
        printk("%02X", ((uint8_t*)data)[i]);
    }
    printk("\n");

    // Check if notifications are enabled before sending
    if (!nus_ntf_enabled) {
        printk("Cannot send response - notifications not enabled!\n");
        return;
    }

    // Get full IAT using the challenge data
    static uint8_t token_buffer[ATT_MAX_TOKEN_SIZE];
    uint32_t token_size = sizeof(token_buffer);
    psa_status_t status;

    // Prepare challenge buffer - TF-M requires 32, 48, or 64 bytes
    uint8_t challenge_buffer[32] = {0}; // Use 32-byte buffer, pad with zeros
    uint32_t challenge_size = sizeof(challenge_buffer);

    // Copy received challenge data (pad with zeros if shorter)
    memcpy(challenge_buffer, data, MIN(len, challenge_size));

    // Get IAT from TF-M using the padded challenge
    status = att_get_iat(challenge_buffer, challenge_size, token_buffer, &token_size);
    if (status != PSA_SUCCESS) {
        printk("ERROR: Failed to get IAT, status: %d\n", status);
        return;
    }

    printk("Got IAT token of %d bytes\n", token_size);

    // Send the full IAT in chunks
    int err;
    int total_chunks = (token_size + NOTIF_CHUNK_SIZE - 1) / NOTIF_CHUNK_SIZE;

    for (int i = 0; i < token_size; i += NOTIF_CHUNK_SIZE) {
        int chunk_size = MIN(NOTIF_CHUNK_SIZE, token_size - i);
        int chunk_num = (i / NOTIF_CHUNK_SIZE) + 1;

        err = bt_nus_send(conn, &token_buffer[i], chunk_size);
        if (err != 0) {
            printk("Notification failed for chunk %d (err %d)\n", chunk_num, err);
            break;
        }

        printk("Sent chunk %d: %d bytes (total: %d/%d)\n",
               chunk_num, chunk_size, i + chunk_size, token_size);

        // Add small delay between chunks to avoid overwhelming the connection
        k_msleep(10);
    }

    printk("=== ATTESTATION COMPLETE ===\n");
    printk("SENT TO DEVICE: %s\n", addr);
    printk("FULL IAT SIZE SENT: %d bytes===============\n", token_size);
}

// Register NUS callbacks
static struct bt_nus_cb nus_cb = {
    .notif_enabled = nus_notif_enabled,
    .received = nus_received,
};

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

    // Register NUS callbacks
    err = bt_nus_cb_register(&nus_cb, NULL);
    if (err) {
        printk("Failed to register NUS callback: %d\n", err);
        return err;
    }

    start_adv();

    printk("Checking TF-M now...\n");
    tfm_get_version();
#ifdef TFM_PSA_API
    tfm_get_sid();
    tfm_psa_crypto_rng();
#endif

    while (1) {
        k_sleep(K_SECONDS(1));
        // NUS handles notifications via callbacks, no periodic notify needed
    }
    return 0;
}