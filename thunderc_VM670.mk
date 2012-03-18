# We're on Sprint (well, Virgin Mobile)
# http://en.wikipedia.org/wiki/Mobile_Network_Code
# Set this properly so that Android Marketplace gets
# this right.
CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490
BLUETOOTH_FIRMWARE := BCM4325D1_004.002.004.0218.0248.hcd
SUB_MODEL := VM670

# Call the common thunderc stuff first to avoid a lot of duplication.
$(call inherit-product, device/lge/thunderc_common/thunderc_common.mk)

# Add in model specific kernel modules
PRODUCT_COPY_FILES += \
    device/lge/thunderc_VM670/files/kernel/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/thunderc_VM670/files/kernel/tun.ko:system/lib/modules/tun.ko
