# Copyright (C) 2013 The CyanogenMod Project
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

# Product-specific compile-time definitions.

BOARD_EGL_CFG := device/sony/huashan/rootdir/system/lib/egl/egl.cfg

# inherit from Sony common
include device/sony/common/BoardConfigCommon.mk

# inherit from msm8960-common
include device/sony/msm8960-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/sony/huashan/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := C5302,C5303,C5306,huashan,lbhuashan
TARGET_SPECIFIC_HEADER_PATH += device/sony/huashan/include

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/huashan

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/msm8960t
TARGET_KERNEL_CONFIG := viskan_huashan_defconfig

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno320
BOARD_VENDOR_PLATFORM := viskan

# Architecture
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := krait

# Architecture flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET      := true
TARGET_KRAIT_BIONIC_PLDOFFS   := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH  := 64
TARGET_KRAIT_BIONIC_PLDSIZE   := 64

# Kernel information
BOARD_KERNEL_BASE     := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom user_debug=31 androidboot.baseband=msm msm_rtb.filter=0x3F ehci-hcd.park=3 vmalloc=400M
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000

# Wifi Config
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_USE_SONY_MACUPDATE := true

BOARD_HARDWARE_CLASS := device/sony/huashan/cmhw

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/huashan/bluetooth

# NFC
BOARD_HAVE_NFC := true

# Needed for blobs
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Time
BOARD_USES_QC_TIME_SERVICES := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Custom boot
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/huashan/custombootimg.mk
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

TARGET_RECOVERY_FSTAB := device/sony/huashan/rootdir/fstab.qcom
RECOVERY_FSTAB_VERSION := 2

BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true
BOARD_HAVE_CSD_FAST_CALL_SWITCH :=true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER_MIC := true

#Fm Radio
QCOM_FM_ENABLED := true

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Legacy RIL
BOARD_HAS_RIL_LEGACY_PAP := true

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 26

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

BOARD_SEPOLICY_DIRS += \
    device/sony/huashan/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    te_macros \
    bluetooth_loader.te \
    bridge.te \
    camera.te \
    device.te \
    dhcp.te \
    domain.te \
    drmserver.te \
    file.te \
    kickstart.te \
    init.te \
    mac_update.te \
    mediaserver.te \
    mpdecision.te \
    netmgrd.te \
    qmux.te \
    sdcardd.te \
    rild.te \
    rmt.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    thermald.te \
    ueventd.te \
    vold.te \
    wpa_supplicant.te

# inherit from the proprietary version
-include vendor/sony/huashan/BoardConfigVendor.mk

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

#
# Optimization Flags for GCC are defined below and applied at the final definition
#

# Graphite Flags
OPT1 := (graphite)
GRAPHITE_FLAGS := \
  -fgraphite \
  -fgraphite-identity \
  -floop-flatten \
  -floop-parallelize-all \
  -ftree-loop-linear \
  -floop-interchange \
  -floop-strip-mine \
  -floop-block \
  -Wno-error=maybe-uninitialized

# Disables Graphite for modules that are not compatible with  the Graphite Flags
LOCAL_DISABLE_GRAPHITE := \
  libmincrypt \
  mkbootimg \
  mkbootfs \
  libhost \
  ibext2_profile \
  make_ext4fs \
  hprof-conv \
  acp \
  libsqlite \
  libsqlite_jni \
  simg2img_host \
  e2fsck \
  append2simg \
  build_verity_tree \
  sqlite3 \
  e2fsck_host \
  libext2_profile_host \
  libext2_quota_host \
  libext2fs_host\
  libbz\
  make_f2fs\
  imgdiff\
  bsdiff \
  libedify \
  fs_config \
  unpackbootimg \
  mkyaffs2image \
  libext2_com_err_host \
  libext2_blkid_host \
  libext2_e2p_host\
  libcrypto-host \
  libexpat-host \
  libicuuc-host \
  libicui18n-host \
  dmtracedump \
  libsparse_host \
  libz-host \
  libfdlibm \
  libsqlite3_android \
  libssl-host \
  libf2fs_dlutils_host \
  libf2fs_utils_host \
  libf2fs_ioutils_host \
  libf2fs_fmt_host_dyn \
  libext2_uuid_host \
  minigzip \
  libdex \
  dexdump \
  dexlist \
  libext4_utils_host \
  third_party_protobuf_protoc_arm_host_gyp \
  libaapt \
  aapt \
  fastboot  \
  libpng \
  aprotoc \
  fio \
  fsck.f2fs \
  libandroidfw \
  libbacktrace_test \
  liblog \
  libgtest_host \
  libbacktrace_libc++ \
  v8_tools_gyp_v8_nosnapshot_arm_host_gyp \
  third_party_icu_icui18n_arm_host_gyp \
  third_party_icu_icuuc_arm_host_gyp \
  tird_party_protobuf_protobuf_full_do_not_use_arm_host_gyp \
  third_party_protobuf_protobuf_full_do_not_use_arm_host_gyp \
  v8_tools_gyp_mksnapshot_arm_host_gyp \
  third_party_libvpx_libvpx_obj_int_extract_arm_host_gyp \
  libutils \
  libcutils \
  libexpat \
  v8_tools_gyp_v8_base_arm_host_gyp \
  v8_tools_gyp_v8_libbase_arm_host_gyp \
  v8_tools_gyp_v8_libbase_arm_host_gyp_32 \
  aidl \
  libziparchive-host \
  libcrypto_static \
  libunwind-ptrace \
  libgtest_main_host \
  libbacktrace \
  backtrace_test \
  libzopfli \
  zipalign \
  rsg-generator \
  unrar \
  libunz \
  adb \
  libzipfile \
  rsg-generator_support \
  libunwindbacktrace \
  libc_common \
  libz \
  libselinux \
  checkfc \
  checkseapp \
  checkpolicy \
  libsepol \
  libpcre \
  libunwind \
  libFFTEm \
  libicui18n \
  libskia \
  libvpx \
  libmedia_jni \
  libstagefright_mp3dec \
  libart \
  mdnsd \
  libwebrtc_spl \
  third_party_WebKit_Source_core_webcore_svg_gyp \
  libjni_filtershow_filters \
  libavformat \
  libavcodec \
  skia_skia_library_gyp \
  libFraunhoferAAC

# Utilize O3 Optimization
OPT3 := (O3)

# Utilize the Strict Flag for GCC
OPT4 := (krait)

# Here we define all the GCC Optimization in a single line if they are uncommented
GCC_OPTIMIZATION_LEVELS := $(OPT1)$(OPT2)$(OPT3)$(OPT4)
