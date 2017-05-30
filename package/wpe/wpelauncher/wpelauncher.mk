###############################################################################
#
# WPELauncher
#
################################################################################

WPELAUNCHER_VERSION = 734991a2f851899adbdb1be7df7a27ccfe20c7d4
WPELAUNCHER_SITE = $(call github,WebPlatformForEmbedded,WPEWebKitLauncher,$(WPELAUNCHER_VERSION))

WPELAUNCHER_DEPENDENCIES = wpewebkit

define WPELAUNCHER_BINS
	$(INSTALL) -D -m 0644 package/wpe/wpelauncher/wpe.{txt,conf} $(BINARIES_DIR)/
	$(INSTALL) -D -m 0755 package/wpe/wpelauncher/wpe $(TARGET_DIR)/usr/bin
endef

define WPELAUNCHER_AUTOSTART
	$(INSTALL) -D -m 0755 package/wpe/wpelauncher/S90wpe $(TARGET_DIR)/etc/init.d
endef

WPELAUNCHER_POST_INSTALL_TARGET_HOOKS += WPELAUNCHER_BINS

ifeq ($(BR2_PACKAGE_PLUGIN_WEBKITBROWSER),)
WPELAUNCHER_POST_INSTALL_TARGET_HOOKS += WPELAUNCHER_AUTOSTART
endif

$(eval $(cmake-package))
