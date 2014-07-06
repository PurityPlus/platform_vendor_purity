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

# Check for target product
ifeq (purity_flo,$(TARGET_PRODUCT))

# Include Purity common configuration
include vendor/purity/config/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/asus/flo/full_flo.mk)

# Override AOSP build properties
PRODUCT_NAME := purity_flo
PRODUCT_BRAND := google
PRODUCT_MODEL := nexus 7
PRODUCT_MANUFACTURER := asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=razor BUILD_FINGERPRINT="google/razor/flo:4.4.4/KTU84P/1227136:user/release-keys" PRIVATE_BUILD_DESC="razor-user 4.4.4 KTU84P 1227136 release-keys"

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/purity/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip

endif