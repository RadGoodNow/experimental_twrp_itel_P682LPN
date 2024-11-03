# Allow broken rules & missing dependencies
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Device path
DEVICE_PATH := device/itel/P682LPN
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := P682LPN_defconfig
TARGET_KERNEL_SOURCE := kernel/itel/P682LPN

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

# Platform
TARGET_BOARD_PLATFORM := P682LPN
PRODUCT_PLATFORM := P682LPN

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    dtbo \
    boot \
    system \
    system_ext \
    vendor \
    product
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_BOOT := boot
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1

# Super
BOARD_SUPER_PARTITION_GROUPS := itel_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504 
BOARD_ITEL_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
BOARD_ITEL_DYNAMIC_PARTITIONS_SIZE := 9122611200

# Temperature path (TO BE TESTED)
TW_CUSTOM_CPU_TEMP_PATH = /sys/class/thermal/thermal_zone3/temp
#TW_CUSTOM_CPU_TEMP_PATH = /sys/devices/platform/soc/soc:aon/64200000.spi/spi_master/spi4/spi4.0/sc27xx-fgu/power_supply/sc27xx-fgu/temp

# Bootimage size
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true

# LUN file path
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage/lun.%d/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file


# Filesystems and partitions
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Encryption
TW_INCLUDE_FBE := true
TW_INCLUDE_CRYPTO := true
TW_USE_FSCRYPT_POLICY := 2
TW_INCLUDE_CRYPTO_FBE := true
TW_CRYPTO_USE_SYSTEM_VOLD := false
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Support for OTG and SDCard
BOARD_ROOT_EXTRA_FOLDERS += usb-otg
BOARD_ROOT_EXTRA_FOLDERS += external_sd

# Build additional required packages
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_USE_TOOLBOX := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace

# TWRP specific flags & configuration
#DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.1.xml # needs to be tested
#DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml # needs to be tested
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TW_DEVICE_VERSION := RadGoodNow@4pda and NikitasFD@4pda
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_HAS_NO_RECOVERY_PARTITION := true
RECOVERY_SDCARD_ON_DATA := true
TW_MTP_DEVICE := /dev/mtp_usb
TW_NO_FASTBOOT_BOOT := true
TW_NO_LEGACY_PROPS := true
TW_THEME := portrait_hdpi
TW_HAS_MTP := true

# Don't build & don't include in build
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_APEX := true
