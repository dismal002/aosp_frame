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

# Inherit baseline Rockchip platform variables
include device/rockchip/rk3326/BoardConfig.mk
BUILD_WITH_GO_OPT := true

# Target Architecture Configuration
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

# Target Output Path Assignments
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_ODM := odm

# Non-AB Storage Defs
BOARD_USES_AB_IMAGE := false
BOARD_ROCKCHIP_VIRTUAL_AB_ENABLE := false

ifeq ($(strip $(BOARD_USES_AB_IMAGE)), true)
    include device/rockchip/common/BoardConfig_AB.mk
    TARGET_RECOVERY_FSTAB := device/rockchip/rk3326/rk3326_r/recovery.fstab_AB
endif

# ==========================================================================
# CUSTOM BOARD OVERRIDES FOR SYLVANIA B_107K PHOTO FRAME
# ==========================================================================

# 1. Physical Screen Layout Characteristics
TARGET_SCREEN_DENSITY := 160

# 2. Kernel Compilation Specifications
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := zImage

# Points the compiler directly to our custom frame's factory kernel setup
TARGET_KERNEL_CONFIG := rk3326_rgo_defconfig
BOARD_KERNEL_DTS := rk3326-sylvania-b107k
# 3. Master Command Line Parameters (Restored from Stock Firmware Baseline)
BOARD_KERNEL_CMDLINE += console=ttyFIQ0 androidboot.baseband=N/A androidboot.wificountrycode=CN androidboot.veritymode=permissive androidboot.selinux=permissive androidboot.hardware=rk30board androidboot.console=ttyFIQ0 androidboot.verifiedbootstate=orange
