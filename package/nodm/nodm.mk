################################################################################
#
# openbox
#
################################################################################

NODM_VERSION = debian/0.12-1
NODM_SITE = $(call github,spanezz,nodm,$(NODM_VERSION))
NODM_LICENSE = GPLv2+
NODM_LICENSE_FILES = COPYING
NODM_DEPENDENCIES = xlib_libX11 linux-pam

$(eval $(autotools-package))
