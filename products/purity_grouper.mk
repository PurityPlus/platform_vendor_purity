# Copyright (C) 2012 Purity Project
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
ifeq (purity_grouper,$(TARGET_PRODUCT))

# Include Purity common configuration
include vendor/purity/config/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Override AOSP build properties
PRODUCT_NAME := purity_grouper
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi BUILD_FINGERPRINT="google/nakasi/grouper:4.4.2/KOT49H/937116:user/release-keys"
PRIVATE_BUILD_DESC="nakasi-user 4.4.2 KOT49H 937116 release-keys"

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/purity/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

endif
