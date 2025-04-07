# Install script for directory: /home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "MinSizeRel")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/home/blanc/zephyr-sdk-0.17.0/arm-zephyr-eabi/bin/arm-zephyr-eabi-objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/lib/ext/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/lib/fih/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/tools/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/secure_fw/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/interface/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/bl2/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/platform/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/bin/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/lib/s_veneers.o")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/lib" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/secure_fw/s_veneers.o")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/client.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/error.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/client.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/error.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa_manifest/sid.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa_manifest" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/generated/interface/include/psa_manifest/sid.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/config_impl.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/generated/interface/include/config_impl.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_veneers.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_ns_interface.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_veneers.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_ns_interface.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_ns_client_ext.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_ns_client_ext.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/config_tfm.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/secure_fw/include/config_tfm.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/config_base.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/config/config_base.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_psa_call_pack.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_psa_call_pack.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/framework_feature.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/generated/interface/include/psa/framework_feature.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/protected_storage.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/storage_common.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/protected_storage.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/storage_common.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_ps_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_ps_defs.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/internal_trusted_storage.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/storage_common.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/internal_trusted_storage.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/storage_common.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_its_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_its_defs.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/README.rst;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/build_info.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_adjust_auto_enabled.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_adjust_config_dependencies.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_adjust_config_key_pair_types.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_adjust_config_synonyms.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_builtin_composites.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_builtin_key_derivation.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_builtin_primitives.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_compat.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_driver_common.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_driver_contexts_composites.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_driver_contexts_key_derivation.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_driver_contexts_primitives.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_extra.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_legacy.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_platform.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_se_driver.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_sizes.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_struct.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_types.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/crypto_values.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/README.rst"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/build_info.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_adjust_auto_enabled.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_adjust_config_dependencies.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_adjust_config_key_pair_types.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_adjust_config_synonyms.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_builtin_composites.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_builtin_key_derivation.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_builtin_primitives.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_compat.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_driver_common.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_driver_contexts_composites.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_driver_contexts_key_derivation.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_driver_contexts_primitives.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_extra.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_legacy.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_platform.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_se_driver.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_sizes.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_struct.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_types.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_values.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_crypto_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_crypto_defs.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/mbedtls")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/mbedtls")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa/initial_attestation.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/psa" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/generated/interface/include/psa/initial_attestation.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_attest_defs.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_attest_iat_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_attest_defs.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_attest_iat_defs.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/tfm_platform_api.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_platform_api.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/crypto_keys")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/crypto_keys")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src/tfm_tz_psa_ns_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_tz_psa_ns_api.c")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include/os_wrapper")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/include" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/include/os_wrapper")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src/os_wrapper")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/src/os_wrapper")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src/tfm_ps_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_ps_api.c")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src/tfm_its_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_its_api.c")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src/tfm_crypto_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_crypto_api.c")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src/tfm_attest_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_attest_api.c")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src/tfm_platform_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/interface/src" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_platform_api.c")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/scripts")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/bl2/ext/mcuboot/scripts" REGEX "/scripts\\/[^/]*\\.py$" PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ GROUP_EXECUTE GROUP_READ REGEX "/scripts\\/wrapper\\/[^/]*\\.py$" PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ GROUP_EXECUTE GROUP_READ)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/scripts/imgtool")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/scripts" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/bootloader/mcuboot/scripts/imgtool")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/layout_files/signing_layout_s.o")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/layout_files" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/bl2/ext/mcuboot/CMakeFiles/signing_layout_s.dir/./signing_layout_s.o")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/keys/image_s_signing_private_key.pem")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/keys" TYPE FILE MESSAGE_LAZY RENAME "image_s_signing_private_key.pem" FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/bl2/ext/mcuboot/root-EC-P256.pem")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/keys/image_s_signing_public_key.pem")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/keys" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/bin/image_s_signing_public_key.pem")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/layout_files/signing_layout_ns.o")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/layout_files" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/./signing_layout_ns.o")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/keys/image_ns_signing_private_key.pem")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/keys" TYPE FILE MESSAGE_LAZY RENAME "image_ns_signing_private_key.pem" FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/bl2/ext/mcuboot/root-EC-P256_1.pem")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/keys/image_ns_signing_public_key.pem")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/image_signing/keys" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/bin/image_ns_signing_public_key.pem")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/config/cp_check.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/config" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/config/cp_check.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  MESSAGE("----- Installing platform NS -----")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/ext/cmsis/Include")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/ext/cmsis" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/platform/ext/cmsis/CMSIS/Core/Include")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/ext/common/uart_stdout.c;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/ext/common/uart_stdout.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/ext/common" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/platform/ext/common/uart_stdout.c"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/platform/ext/common/uart_stdout.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/include")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/platform/include")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/CMakeLists.txt")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns" TYPE FILE MESSAGE_LAZY RENAME "CMakeLists.txt" FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/cmake/spe-CMakeLists.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/toolchain_ns_GNUARM.cmake;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/toolchain_ns_ARMCLANG.cmake;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/toolchain_ns_IARARM.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/platform/ns/toolchain_ns_GNUARM.cmake"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/platform/ns/toolchain_ns_ARMCLANG.cmake"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/platform/ns/toolchain_ns_IARARM.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/include/fih.h;/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/include/tfm_plat_ns.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/platform/include" TYPE FILE MESSAGE_LAZY FILES
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/lib/fih/inc/fih.h"
    "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/platform/include/tfm_plat_ns.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/CMakeFiles/tfm_config.dir/install-cxx-module-bmi-MinSizeRel.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/secure_fw/partitions/crypto/CMakeFiles/psa_crypto_config.dir/install-cxx-module-bmi-MinSizeRel.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/interface/CMakeFiles/psa_interface.dir/install-cxx-module-bmi-MinSizeRel.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/spe_export.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/spe_export.cmake"
         "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/CMakeFiles/Export/da0d75e27925b7d262557278c3e5eaaf/spe_export.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/spe_export-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/spe_export.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/spe_export.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/CMakeFiles/Export/da0d75e27925b7d262557278c3e5eaaf/spe_export.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake/set_extensions.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/api_ns/cmake" TYPE FILE MESSAGE_LAZY FILES "/home/blanc/zephyrproject/modules/tee/tf-m/trusted-firmware-m/cmake/set_extensions.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/blanc/zephyrproject/zephyr/samples/bluetooth/peripheral_sc_only/build/tfm/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
