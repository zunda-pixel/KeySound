export TARGET = iphone:clang:13.4:8.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = KeySoundPref
$(BUNDLE_NAME)_FILES = $(wildcard *.m) $(wildcard *.x)
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc
$(BUNDLE_NAME)_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += Tweak Prefs
include $(THEOS_MAKE_PATH)/aggregate.mk

internal-stage::
	$(ECHO_NOTHING)mv "$(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/KeySound.dylib" "$(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/   KeySound.dylib" $(ECHO_END)
	$(ECHO_NOTHING)mv "$(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/KeySound.plist" "$(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/   KeySound.plist" $(ECHO_END)


