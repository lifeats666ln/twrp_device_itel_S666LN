#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/itel/S666LN

# Inherit from mt6789-common
include device/transsion/mt6789-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := S666LN

# Relax ELF prebuilts in PRODUCT_COPY_FILES rule
# https://android.googlesource.com/platform/build/+/refs/heads/main/Changes.md#elf-prebuilts-in-build_broken_elf_prebuilt_product_copy_files
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Crypto
AERA_INCLUDE_FBE_METADATA_DECRYPT := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_S666LN
TARGET_RECOVERY_DEVICE_MODULES := libinit_S666LN
