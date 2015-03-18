ifeq ($(_THEOS_TARGET_LOADED),)
_THEOS_TARGET_LOADED := 1
THEOS_TARGET_NAME := iphone

SDKTARGET ?= armv7-apple-darwin11
SDKBINPATH ?= $(THEOS)/toolchain/linux-x64/bin
SYSROOT ?= $(THEOS)/sdk
ISYSROOT ?= $(SYSROOT)

PREFIX := $(SDKBINPATH)/$(SDKTARGET)-

TARGET_CC ?= $(PREFIX)clang
TARGET_CXX ?= $(PREFIX)clang++
TARGET_LD ?= $(PREFIX)clang++
TARGET_STRIP ?= $(PREFIX)strip
TARGET_STRIP_FLAGS ?= -x
TARGET_CODESIGN_ALLOCATE ?= $(PREFIX)codesign_allocate
TARGET_CODESIGN ?= $(PREFIX)ldid
TARGET_CODESIGN_FLAGS ?= -S

include $(THEOS_MAKE_PATH)/targets/_common/darwin.mk
include $(THEOS_MAKE_PATH)/targets/_common/darwin_flat_bundle.mk

TARGET_PRIVATE_FRAMEWORK_PATH = $(SYSROOT)/System/Library/PrivateFrameworks
TARGET_PRIVATE_FRAMEWORK_INCLUDE_PATH = $(ISYSROOT)/System/Library/PrivateFrameworks

SDKFLAGS := 
_THEOS_TARGET_CFLAGS := -isysroot $(ISYSROOT) $(SDKFLAGS) -I$(SYSROOT)/usr/include/c++/4.2.1
_THEOS_TARGET_LDFLAGS := -isysroot $(SYSROOT) $(SDKFLAGS) -multiply_defined suppress

TARGET_INSTALL_REMOTE := $(_THEOS_TRUE)
_THEOS_TARGET_DEFAULT_PACKAGE_FORMAT := deb
endif
