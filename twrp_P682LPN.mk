#INHERIT COMMON STUFF
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

#INHERIT GSI KEYS
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

#INHERIT TWRP
$(call inherit-product, vendor/twrp/config/common.mk)

#INHERIT FROM THIS DEVICE TREE
$(call inherit-product, device/itel/P682LPN/device.mk)

PRODUCT_DEVICE := P682LPN
PRODUCT_NAME := twrp_P682LPN
PRODUCT_BRAND := itel
PRODUCT_MODEL := Vision 3 Plus
PRODUCT_MANUFACTURER := itel