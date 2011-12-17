# Copyright (C) 2011 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS += device/huawei/c8500/overlay

PRODUCT_PACKAGES += \
    libRS \
    hwprops \
    rzscontrol \
    Gallery \
    lights.c8500 \
    copybit.c8500 \
    gps.c8500

# Vold config
PRODUCT_COPY_FILES += \
    device/huawei/c8500/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Hardware permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Init files
PRODUCT_COPY_FILES += \
    device/huawei/c8500/prebuilt/init.c8500.rc:root/init.c8500.rc \
    device/huawei/c8500/prebuilt/ueventd.huawei.rc:root/ueventd.huawei.rc

# OEM logo and boot splash
PRODUCT_COPY_FILES += \
    device/huawei/c8500/prebuilt/initlogo.rle:root/initlogo.rle

# Wi-Fi releated
PRODUCT_COPY_FILES += \
    device/huawei/c8500/prebuilt/etc/firmware/fw_bcm4319_apsta.bin:system/etc/firmware/fw_bcm4319_apsta.bin \
    device/huawei/c8500/prebuilt/etc/firmware/fw_bcm4319.bin:system/etc/firmware/fw_bcm4319.bin \
    device/huawei/c8500/prebuilt/etc/firmware/nvram.txt:system/etc/firmware/nvram.txt \
    device/huawei/c8500/prebuilt/lib/modules/bcm4319.ko:system/lib/modules/bcm4319.ko \
    device/huawei/c8500/prebuilt/lib/modules/zram.ko:system/lib/modules/zram.ko \
    device/huawei/c8500/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/huawei/c8500/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Other
PRODUCT_COPY_FILES += \
    device/huawei/c8500/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/huawei/c8500/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf \
    device/huawei/c8500/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/huawei/c8500/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv

PRODUCT_COPY_FILES += device/huawei/c8500/prebuilt/kernel:kernel

$(call inherit-product-if-exists, vendor/huawei/c8500/c8500-vendor.mk)

$(call inherit-product, build/target/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_cn_supl.mk)

# LDPI assets
PRODUCT_LOCALES += ldpi mdpi

PRODUCT_NAME := huawei_c8500
PRODUCT_DEVICE := c8500
PRODUCT_MODEL := c8500
PRODUCT_BRAND := huawei
PRODUCT_MANUFACTURER := huawei
PRODUCT_LOCALES := zh_CN zh_TW en_US
PRODUCT_DEFAULT_REGION := CN

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-huawei-cn \
    ro.cdma.home.operator.numeric=46003 \
    ro.cdma.home.operator.alpha=中国电信 \
    ro.telephony.default_network=4 \
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM,NV \
    ro.cdma.voicemail.number=mine \
    ro.setupwizard.enable_bypass=1 \
    keyguard.no_require_sim=

# add the addons
$(call inherit-product-if-exists, addons/addons.mk)
