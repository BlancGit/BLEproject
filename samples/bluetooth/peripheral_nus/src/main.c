/*
 * Copyright (c) 2024 Croxel, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr/kernel.h>
#include <zephyr/bluetooth/bluetooth.h>
#include <zephyr/bluetooth/services/nus.h>

#define DEVICE_NAME		CONFIG_BT_DEVICE_NAME
#define DEVICE_NAME_LEN		(sizeof(DEVICE_NAME) - 1)

#define CHUNK_SIZE       16            // Initial received data size (16 bytes)
#define DUPLICATED_SIZE  64            // Duplicated data size (64 bytes)
#define NOTIF_CHUNK_SIZE 20           // Max notification chunk size

static const struct bt_data ad[] = {
	BT_DATA_BYTES(BT_DATA_FLAGS, (BT_LE_AD_GENERAL | BT_LE_AD_NO_BREDR)),
	BT_DATA(BT_DATA_NAME_COMPLETE, DEVICE_NAME, DEVICE_NAME_LEN),
};

static const struct bt_data sd[] = {
	BT_DATA_BYTES(BT_DATA_UUID128_ALL, BT_UUID_NUS_SRV_VAL),
};

static void notif_enabled(bool enabled, void *ctx)
{
	ARG_UNUSED(ctx);

	printk("%s() - %s\n", __func__, (enabled ? "Enabled" : "Disabled"));
}

static void received(struct bt_conn *conn, const void *data, uint16_t len, void *ctx)
{
	uint8_t rx_data[CHUNK_SIZE] = {0};  // Buffer to store received data
	uint8_t tx_data[DUPLICATED_SIZE] = {0}; // Buffer to store duplicated data
	int err;

	printk("Received %d bytes from mobile\n", len);

	// Copy received data into rx_data (up to 16 bytes)
	memcpy(rx_data, data, MIN(len, CHUNK_SIZE));

	// Duplicate the 16 bytes into 64 bytes
	for (int i = 0; i < 4; i++) {
		memcpy(&tx_data[i * CHUNK_SIZE], rx_data, CHUNK_SIZE);
	}

	// Send the duplicated data in chunks of 20 bytes
	for (int i = 0; i < DUPLICATED_SIZE; i += NOTIF_CHUNK_SIZE) {
		int chunk_size = MIN(NOTIF_CHUNK_SIZE, DUPLICATED_SIZE - i); // Remaining bytes to send
		err = bt_nus_send(conn, &tx_data[i], chunk_size);  // Send chunk
		if (err != 0) {
			printk("Notification failed for chunk %d (err %d)\n", i / NOTIF_CHUNK_SIZE, err);
			break;
		}
		printk("Sent chunk %d of %d bytes\n", i / NOTIF_CHUNK_SIZE, chunk_size);
	}
}

struct bt_nus_cb nus_listener = {
	.notif_enabled = notif_enabled,
	.received = received,
};

int main(void)
{
	int err;

	printk("Sample - Bluetooth Peripheral NUS\n");

	// Register the NUS callback
	err = bt_nus_cb_register(&nus_listener, NULL);
	if (err) {
		printk("Failed to register NUS callback: %d\n", err);
		return err;
	}

	// Enable Bluetooth
	err = bt_enable(NULL);
	if (err) {
		printk("Failed to enable bluetooth: %d\n", err);
		return err;
	}

	// Start advertising with NUS service
	err = bt_le_adv_start(BT_LE_ADV_CONN_FAST_1, ad, ARRAY_SIZE(ad), sd, ARRAY_SIZE(sd));
	if (err) {
		printk("Failed to start advertising: %d\n", err);
		return err;
	}

	printk("Initialization complete\n");

	while (true) {
		k_sleep(K_SECONDS(3));
	}

	return 0;
}
	