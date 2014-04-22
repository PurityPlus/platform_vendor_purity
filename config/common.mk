# Copyright (C) 2013 Purity Project
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

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/purity/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/purity/overlay/$(TARGET_PRODUCT)

# Copy custom ramdisk
PRODUCT_COPY_FILES += \
    vendor/purity/prebuilt/etc/init.purity.rc:root/init.purity.rc

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/purity/prebuilt/bin/sysinit:system/bin/sysinit 

# userinit support
PRODUCT_COPY_FILES += \
    vendor/purity/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# APN
PRODUCT_COPY_FILES += \
    vendor/purity/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Gapps backup script
PRODUCT_COPY_FILES += \
    vendor/purity/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/purity/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/purity/prebuilt/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/purity/prebuilt/bin/su:system/xbin/daemonsu \
    vendor/purity/prebuilt/bin/su:system/xbin/su \
    vendor/purity/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon \
    vendor/purity/prebuilt/apk/Superuser.apk:system/app/Superuser.apk

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Busybox
PRODUCT_PACKAGES += \
        Busybox

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk
       

