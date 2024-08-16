# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from P682LPN device
$(call inherit-product, device/itel/P682LPN/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := P682LPN
PRODUCT_NAME := twrp_P682LPN
PRODUCT_BRAND := itel
PRODUCT_MODEL := Vision 3 Plus
PRODUCT_MANUFACTURER := itel