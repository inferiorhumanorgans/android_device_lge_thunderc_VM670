# Call the common thunderc stuff first to avoid a lot of duplication.
$(call inherit-product, device/lge/thunderc_common/thunderc.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderc_VM670/overlay

PRODUCT_NAME := full_thunderc_VM670
PRODUCT_DEVICE := thunderc_VM670

LOCAL_KERNEL := device/lge/thunderc_VM670/files/kernel/zImage
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Backlight
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/hw/lights.thunderc.so:system/lib/hw/lights.thunderc.so \

# Keylayouts
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/usr/keychars/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \

# Locate vendor bootimage files if present
# Because these are carrier specific, I've left the default to no logo.
BOOTIMAGE_FILES := $(wildcard device/lge/thunderc_VM670/files/bootimages/*.rle)

ifeq ($(BOOTIMAGE_FILES),)
  PRODUCT_COPY_FILES += \
      device/lge/thunderc_common/files/initlogo.rle:root/initlogo.rle
else
  PRODUCT_PACKAGES += bootlogo
  PRODUCT_COPY_FILES += \
      $(foreach f,$(BOOTIMAGE_FILES),$(f):root/bootimages/$(notdir $(f)))
endif

# We're on Sprint (well, Virgin Mobile)
# http://en.wikipedia.org/wiki/Mobile_Network_Code
# Set this properly so that Android Marketplace gets
# this right.
CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490
BLUETOOTH_FIRMWARE := BCM4325D1_004.002.004.0218.0248.hcd

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

# 2D (using proprietary because of poor performance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/hw/gralloc.thunderc.so:system/lib/hw/gralloc.thunderc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/hw/copybit.thunderc.so:system/lib/hw/copybit.thunderc.so \

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/hw/sensors.thunderc.so:system/lib/hw/sensors.thunderc.so \
    vendor/lge/thunderc/proprietary/VM670/system/bin/ami304d:system/bin/ami304d \

# GPS
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libloc_api.so:system/lib/libloc_api.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libgps.so:system/lib/libgps.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libloc.so:system/lib/libloc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libloc.so:obj/lib/libloc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libcommondefs.so:system/lib/libcommondefs.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libloc-rpc.so:system/lib/libloc-rpc.so

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/thunderc/proprietary/VM670/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/thunderc/proprietary/VM670/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \


# WiFi
PRODUCT_COPY_FILES += \
    device/lge/thunderc_VM670/files/kernel/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/thunderc_VM670/files/kernel/tun.ko:system/lib/modules/tun.ko \
    vendor/lge/thunderc/proprietary/VM670/system/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/thunderc/proprietary/VM670/system/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/thunderc/proprietary/VM670/system/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/thunderc/proprietary/VM670/system/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/etc/vold.fstab:system/etc/vold.fstab \

# Audio
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libaudioeq.so:system/lib/libaudioeq.so \

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/bin/qmuxd:system/bin/qmuxd \
    
# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libril.so:system/lib/libril.so \
    vendor/lge/thunderc/proprietary/VM670/system/bin/rild:system/bin/rild \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/thunderc/proprietary/VM670/system/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

# CND
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/bin/cnd:system/bin/cnd
    
# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/VM670/system/bin/$(BLUETOOTH_FIRMWARE):system/bin/BCM4325.hcd

