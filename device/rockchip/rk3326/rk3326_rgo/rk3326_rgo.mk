#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License\");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# First launching is R, api_level is 30
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_DTBO_TEMPLATE := $(LOCAL_PATH)/dt-overlay.in
PRODUCT_BOOT_DEVICE := ff390000.dwmmc,ff3b0000.nandc

# Inherit Rockchip Common Dynamic Partitions and Base Configurations
include device/rockchip/common/build/rockchip/DynamicPartitions.mk
include device/rockchip/rk3326/rk3326_rgo/BoardConfig.mk
include device/rockchip/common/BoardConfig.mk
$(call inherit-product, device/rockchip/rk3326/device-common.mk)
$(call inherit-product, device/rockchip/common/device.mk)

PRODUCT_CHARACTERISTICS := tablet

# ==========================================================================
# OVERRIDE TARGET TARGET TARGET IDENTITY FOR SYLVANIA PHOTO FRAME
# ==========================================================================
PRODUCT_NAME := rk3326_rgo
PRODUCT_DEVICE := rk3326_rgo
PRODUCT_BRAND := SYLVANIA
PRODUCT_MODEL := B_107K
PRODUCT_MANUFACTURER := kjm

# ==========================================================================
# CUSTOM HARDWARE PATCHES & SCRIPTS INJECTIONS
# ==========================================================================

# Retain individual widevine decryption keys across factory resets
PRODUCT_PACKAGES += \
    move_widevine_data.sh

# ==========================================================================
# CLEAN INHERITANCE: HOOK UP THE PURGED CLEAN VENDOR TREE
# ==========================================================================
$(call inherit-product-if-exists, vendor/kjm/B_107K/B_107K-vendor.mk)


PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.swrotation=90 \
    ro.surface_flinger.primary_display_orientation=ORIENTATION_90
PRODUCT_PACKAGES := $(filter-out mraad, $(PRODUCT_PACKAGES))
PRODUCT_PACKAGES := $(filter-out libmraa, $(PRODUCT_PACKAGES))
