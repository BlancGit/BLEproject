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

#define CHUNK_SIZE       16            // Initial received data size (16 bytes)
#define DUPLICATED_SIZE  64            // Duplicated data size (64 bytes)
#define NOTIF_CHUNK_SIZE 20           // Max notification chunk size
#define TOKEN_BUF_SIZE   2048          // Max attestation token size
#define CHALLENGE_SIZE   32            // PSA attestation challenge size
#define RESPONSE_SIZE    64            // Compact response size (32-byte hash + 32-byte challenge echo)

#include "tfm_ns_interface.h"
#ifdef TFM_PSA_API
#include "psa_manifest/sid.h"
#include "psa/crypto.h"
#include "psa/initial_attestation.h"
#endif

static bool nus_ntf_enabled;

static const struct bt_data ad[] = {
    BT_DATA_BYTES(BT_DATA_FLAGS, (BT_LE_AD_GENERAL | BT_LE_AD_NO_BREDR)),
    BT_DATA(BT_DATA_NAME_COMPLETE, CONFIG_BT_DEVICE_NAME, sizeof(CONFIG_BT_DEVICE_NAME) - 1),
};

static const struct bt_data sd[] = {
    BT_DATA_BYTES(BT_DATA_UUID128_ALL, BT_UUID_NUS_SRV_VAL),
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

static void nus_notif_enabled(bool enabled, void *ctx)
{
    ARG_UNUSED(ctx);
    nus_ntf_enabled = enabled;
    printk("NUS notification status changed: %s\n", enabled ? "enabled" : "disabled");
}

static void nus_received(struct bt_conn *conn, const void *data, uint16_t len, void *ctx)
{
    uint8_t challenge[CHALLENGE_SIZE] = {0};  // PSA attestation requires 32-byte challenge
    static uint8_t token_buf[TOKEN_BUF_SIZE]; // Buffer for attestation token
    uint8_t response_buf[RESPONSE_SIZE] = {0}; // Compact response buffer
    size_t token_size = 0;
    psa_status_t status;
    int err;
    char addr[BT_ADDR_LE_STR_LEN];

    // Get the address of the device that sent the challenge
    bt_addr_le_to_str(bt_conn_get_dst(conn), addr, sizeof(addr));

    printk("=== CHALLENGE RECEIVED ===\n");
    printk("FROM DEVICE: %s\n", addr);
    printk("CHALLENGE SIZE: %d bytes\n", len);
    printk("Notifications enabled: %s\n", nus_ntf_enabled ? "yes" : "no");

    // Copy received data into challenge buffer (pad with zeros if less than 32 bytes)
    memcpy(challenge, data, MIN(len, CHALLENGE_SIZE));
    
    // If received data is less than 32 bytes, pad the rest
    if (len < CHALLENGE_SIZE) {
        printk("Challenge padded from %d to %d bytes\n", len, CHALLENGE_SIZE);
    }

    // Display the full challenge for verification
    printk("CHALLENGE RECEIVED (full 32 bytes): ");
    for (int i = 0; i < CHALLENGE_SIZE; i++) {
        printk("%02X", challenge[i]);
        if (i % 8 == 7) printk(" ");  // Space every 8 bytes for readability
    }
    printk("\n");

#ifdef TFM_PSA_API
    // Get Initial Attestation Token from TF-M
    printk("Requesting attestation token from TF-M...\n");
    status = psa_initial_attest_get_token(
        challenge, CHALLENGE_SIZE,           // Challenge input
        token_buf, TOKEN_BUF_SIZE,          // Token output buffer
        &token_size);                       // Actual token size

    if (status != PSA_SUCCESS) {
        printk("ERROR: Attestation failed with status: %d\n", status);
        // Send error response
        const char *error_msg = "ATTESTATION_ERROR";
        if (nus_ntf_enabled) {
            bt_nus_send(conn, error_msg, strlen(error_msg));
        }
        return;
    }

    printk("SUCCESS: Got attestation token of %d bytes\n", token_size);
    
    // Hash the attestation token using PSA Crypto
    uint8_t token_hash[32] = {0};  // SHA-256 hash
    size_t hash_length = 0;
    
    status = psa_hash_compute(PSA_ALG_SHA_256, 
                             token_buf, token_size,
                             token_hash, sizeof(token_hash),
                             &hash_length);
    
    if (status != PSA_SUCCESS) {
        printk("ERROR: Failed to hash token, status: %d\n", status);
        return;
    }
    
    printk("\n=== TOKEN HASH (TRIMMED FOR DEVICE DISPLAY) ===\n");
    printk("SHA-256 Hash: ");
    for (int i = 0; i < 32; i++) {
        printk("%02X", token_hash[i]);
        if (i % 8 == 7) printk(" ");
    }
    printk("\n");
    printk("================================================\n");

    // NOTE: Printing hash above but sending FULL IAT to mobile app
    // The full token is already in token_buf with size token_size
    
#else
    // Fallback for non-TF-M builds - create dummy full token
    printk("WARNING: TF-M not available, creating dummy token\n");
    token_size = 256;  // Dummy token size
    memset(token_buf, 0xAB, token_size);  // Fill with dummy data
    // Add some variation with challenge
    for (int i = 0; i < MIN(len, 32); i++) {
        token_buf[i] = ((uint8_t*)data)[i];
    }
#endif

    // Check if notifications are enabled before sending
    if (!nus_ntf_enabled) {
        printk("Cannot send attestation token - notifications not enabled!\n");
        return;
    }

    // Send the FULL attestation token (300-500+ bytes for real, 256 for dummy)
    printk("Sending FULL attestation token (%d bytes) in chunks...\n", token_size);
    int total_sent = 0;
    for (int i = 0; i < token_size; i += NOTIF_CHUNK_SIZE) {
        int chunk_size = MIN(NOTIF_CHUNK_SIZE, token_size - i);
        err = bt_nus_send(conn, &token_buf[i], chunk_size);
        if (err != 0) {
            printk("ERROR: Failed to send chunk %d (err %d)\n", i / NOTIF_CHUNK_SIZE, err);
            break;
        }
        total_sent += chunk_size;
        if (i < 60 || i >= token_size - 20) {  // Only print first 3 and last chunk
            printk("Sent chunk %d: %d bytes (total: %d/%d)\n",
                   i / NOTIF_CHUNK_SIZE, chunk_size, total_sent, token_size);
        }

        // Small delay between chunks to avoid overwhelming BLE stack
        k_msleep(10);
    }

    if (total_sent == token_size) {
        printk("=== ATTESTATION COMPLETE ===\n");
        printk("SENT TO DEVICE: %s\n", addr);
        printk("FULL IAT SIZE SENT: %d bytes (%d chunks)\n", total_sent, (token_size + NOTIF_CHUNK_SIZE - 1) / NOTIF_CHUNK_SIZE);
        printk("Note: Only printed hash (32 bytes) but sent full IAT\n");
        printk("========================\n");
    } else {
        printk("ERROR: Only sent %d of %d bytes to %s\n", total_sent, token_size, addr);
    }
}

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
    printk("Bluetooth initializedddddddddddddddddddddddd\n");
    printk("Bluetooth initializedddddddddddddddddddddddd\n");
    // Register NUS callbacks
    err = bt_nus_cb_register(&nus_cb, NULL);
    if (err) {
        printk("Failed to register NUS callback: %d\n", err);
        return err;
    }
    
    bt_conn_auth_cb_register(&auth_cb_display); 
    bt_conn_auth_info_cb_register(&auth_cb_info);
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