#
# Copyright (C) 2012 The Android Open-Source Project
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

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),samsung)
ifeq ($(TARGET_BOARD_PLATFORM),msm8960)
ifneq ($(filter expressltexx loganreltexx lt02ltespr melius3gxx meliusltexx meliusltespr \
                serrano3gxx serranodsdd serranodsub serranoltebmc serranoltexx \
                serranoltespr serranolteusc wilcoxltexx,$(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
	ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
		$(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini)

$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9310; \
	ln -sf /data/misc/audio/wcd9310_anc.bin \
		$(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_anc.bin; \
	ln -sf /data/misc/audio/mbhc.bin \
		$(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_mbhc.bin)
endif
endif
endif
