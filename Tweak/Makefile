TARGET = iphone:clang:13.4:11.0

include $(THEOS)/makefiles/common.mk

ARCHS = arm64 arm64e

TWEAK_NAME = KeySound

$(BUNDLE_NAME)_FILES = $(wildcard *.m) $(wildcard *.x)
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"

include $(THEOS_MAKE_PATH)/aggregate.mk
