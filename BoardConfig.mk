#
# Copyright (C) 2026 The LineageOS Project
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

DEVICE_PATH := device/GM/GM9PRO_sprout
BOARD_VENDOR := GM
TARGET_OTA_ASSERT_DEVICE := GM9PRO_sprout

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor
	
# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# Audio
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Board
TARGET_BOARD_PLATFORM := sdm660
TARGET_BOOTLOADER_BOARD_NAME := sdm660
BOARD_USES_QCOM_HARDWARE := true
TARGET_ENFORCES_QSSI := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 420
TARGET_USES_GRALLOC1 := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true
TARGET_TAP_TO_WAKE_NODE := "/sys/android_touch/doubletap2wake"

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 
BOARD_KERNEL_CMDLINE += sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=1 firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/GM/GM9PRO_sprout
TARGET_KERNEL_CONFIG := GM9PRO_sprout_defconfig
TARGET_KERNEL_CLANG_VERSION := r416183b
TARGET_KERNEL_CLANG_PATH := $(abspath .)/prebuilts/clang/kernel/$(HOST_PREBUILT_TAG)/clang-$(TARGET_KERNEL_CLANG_VERSION)
TARGET_KERNEL_LLVM_BINUTILS := false

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix_legacy.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/framework_manifest.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml


# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
BOARD_FLASH_BLOCK_SIZE := 0x40000
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 53074673152 # 53074705920 − 32768

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

# Power
TARGET_HAS_NO_WLAN_STATS := true
TARGET_USES_INTERACTION_BOOST := true
BOARD_POWER_CUSTOM_BOARD_LIB := libpower_GM9PRO

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

include device/qcom/sepolicy-legacy-um/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Treble
BOARD_VNDK_VERSION := current

# Vendor SPL
VENDOR_SECURITY_PATCH := 2026-01-05

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true


-include vendor/GM/GM9PRO_sprout/BoardConfigVendor.mk

