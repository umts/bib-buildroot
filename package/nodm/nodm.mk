################################################################################
#
# nodm
#
################################################################################

# Would be better to use a tag, unfortunately nodm tags releases with
# '/'s in them and I don't know how to do that. This is 'debian/0.12-1'
NODM_VERSION = 22eba9bb71fc6951ddb659c1704a71870705d923
NODM_SOURCE = $(NODM_VERSION).tar.gz
NODM_SITE = $(call github, spanezz, nodm, '')
NODM_LICENSE = GPLv2+
NODM_LICENSE_FILES = COPYING
NODM_DEPENDENCIES = xlib_libX11 linux-pam
NODM_AUTORECONF = YES

$(eval $(autotools-package))
