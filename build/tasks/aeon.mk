# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
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

# -----------------------------------------------------------------
# AeonOS OTA update package

AEON_TARGET_PACKAGE := $(PRODUCT_OUT)/$(AEON_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

$(AEON_TARGET_PACKAGE): $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(AEON_TARGET_PACKAGE)
	$(hide) $(SHA256) $(AEON_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(AEON_TARGET_PACKAGE).sha256sum
	@echo "Package Complete: $(AEON_TARGET_PACKAGE)" >&2

.PHONY: aeon
aeon: $(AEON_TARGET_PACKAGE) $(DEFAULT_GOAL)
