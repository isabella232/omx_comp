ifeq ($(strip $(USE_INTEL_OMX_COMPONENTS)),true)

LOCAL_PATH := $(call my-dir)

# Version set to Android Jelly Bean
ALOG_VERSION_REQ := 4.1
ALOG_VERSION := $(filter $(ALOG_VERSION_REQ),$(firstword $(sort $(PLATFORM_VERSION) \
                                   $(ALOG_VERSION_REQ))))

# Android Jelly Bean defined ALOGx, older versions use LOGx
ifeq ($(ALOG_VERSION), $(ALOG_VERSION_REQ))
OMXLOG_CFLAGS += -DANDROID_ALOG -DANDROID_JB
else
OMXLOG_CFLAGS += -DANDROID_LOG -DANDROID_PRE_JB
endif

include $(CLEAR_VARS)
LOCAL_MODULE := wrs_omxil_components.list
LOCAL_SRC_FILES := wrs_omxil_components.list
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
VENDORS_INTEL_MRST_COMPONENTS_ROOT := $(LOCAL_PATH)


WRS_OMXIL_CORE_ROOT := hardware/intel/wrs_omxil_core

# mrst sst audio
#-include $(VENDORS_INTEL_MRST_COMPONENTS_ROOT)/sst/Android.mk

#intel video codecs
include $(VENDORS_INTEL_MRST_COMPONENTS_ROOT)/videocodec/Android.mk

#intel audio codecs
#-include $(VENDORS_INTEL_MRST_COMPONENTS_ROOT)/sst-stub-base/Android.mk

endif #BOARD_USES_MRST_OMX
