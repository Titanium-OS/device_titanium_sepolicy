#
# This policy configuration will be used by all products that
# inherit from Titanium
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/titanium/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/titanium/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/titanium/sepolicy/common/dynamic
else
BOARD_SEPOLICY_DIRS += \
    device/titanium/sepolicy/common/dynamic \
    device/titanium/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/xtended/sepolicy/legacy-common/sepolicy.mk
