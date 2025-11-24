# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)

# Enable TF-M Measured Boot partition to include NSPE measurements
set(TFM_PARTITION_MEASURED_BOOT ON CACHE BOOL "Enable Measured Boot partition")

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(peripheral_sc_only)

target_sources(app PRIVATE
  src/main.c
)
target_sources(app PRIVATE src/psa_attestation.c)
target_sources(app PRIVATE src/util_sformat.c)
target_sources(app PRIVATE src/util_app_log.c)

target_include_directories(app PRIVATE
  $<TARGET_PROPERTY:tfm,TFM_BINARY_DIR>/api_ns/interface/include
)

zephyr_library_include_directories(${ZEPHYR_BASE}/samples/bluetooth)
