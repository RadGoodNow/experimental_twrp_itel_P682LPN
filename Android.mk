LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),P682LPN)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
