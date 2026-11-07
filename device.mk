#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt6789-common
$(call inherit-product, device/transsion/mt6789-common/common.mk)

# Touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/touch/adaptive-ts.ko:recovery/root/lib/modules/adaptive-ts.ko

# GPU
PRODUCT_COPY_FILES += \
    vendor/recovery/prebuilt/arm64/xz:recovery/root/system/bin/aera-gpu-xz

# AERA
$(call inherit-product, $(LOCAL_PATH)/aera_S666LN.mk)
