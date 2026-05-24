#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
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

#$_rbox_$_modify_$_zhengyang: add displayd
PRODUCT_PACKAGES += \
    displayd \
    libion

#enable this for support f2fs with data partion
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# used for fstab_generator, sdmmc controller address
PRODUCT_SDMMC_DEVICE := 10214000.dwmmc
BOARD_SEPOLICY_DIRS += device/rockchip/rk3126c/sepolicy_vendor

# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
ifeq ($(HOST_OS),linux)
  TARGET_USERIMAGES_USE_F2FS := true
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.recovery.rk30board.rc:recovery/root/init.recovery.rk30board.rc \
    vendor/rockchip/common/bin/$(TARGET_ARCH)/busybox:recovery/root/sbin/busybox

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rk3126c.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rk3126c.rc \
    $(LOCAL_PATH)/init.rk3126c.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rk3126c.usb.rc \
    $(LOCAL_PATH)/wake_lock_filter.xml:system/etc/wake_lock_filter.xml \
    device/rockchip/$(TARGET_BOARD_PLATFORM)/package_performance.xml:$(TARGET_COPY_OUT_ODM)/etc/package_performance.xml \
    device/rockchip/$(TARGET_BOARD_PLATFORM)/media_profiles_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml \
    vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml

#
## setup boot-shutdown animation configs.
#
HAVE_BOOT_ANIMATION := $(shell test -f $(TARGET_DEVICE_DIR)/bootanimation.zip && echo true)
HAVE_SHUTDOWN_ANIMATION := $(shell test -f $(TARGET_DEVICE_DIR)/shutdownanimation.zip && echo true)

ifeq ($(HAVE_BOOT_ANIMATION), true)
PRODUCT_COPY_FILES += $(TARGET_DEVICE_DIR)/bootanimation.zip:$(TARGET_COPY_OUT_ODM)/media/bootanimation.zip
endif

ifeq ($(HAVE_SHUTDOWN_ANIMATION), true)
PRODUCT_COPY_FILES += $(TARGET_DEVICE_DIR)/shutdownanimation.zip:$(TARGET_COPY_OUT_ODM)/media/shutdownanimation.zip
endif

#for enable optee support
ifeq ($(strip $(PRODUCT_HAVE_OPTEE)),true)
#Choose TEE storage type
#auto (storage type decide by storage chip emmc:rpmb nand:rkss)
#rpmb
#rkss
PRODUCT_PROPERTY_OVERRIDES += ro.tee.storage=rkss
PRODUCT_COPY_FILES += \
       device/rockchip/common/init.optee_verify.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.optee.rc
endif

#add Rockchip properties here
#
PRODUCT_PROPERTY_OVERRIDES += \
                ro.opengles.version=131072 \
                ro.ril.ecclist=112,911 \
                wifi.interface=wlan0 \
                rild.libpath=/system/lib/libril-rk29-dataonly.so \
                rild.libargs=-d /dev/ttyACM0 \
                vendor.hwc.compose_policy=6 \
                wifi.supplicant_scan_interval=15 \
                ro.build.shutdown_timeout=6 \
                debug.hwui.use_partial_updates=false \
                persist.enable_task_snapshots=false \
                ro.lmk.downgrade_pressure=70
