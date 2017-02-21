ifeq ($(BUS_INFO_BOARD_ROOTFS_ISO9660_HYBRID_INITRD_SHIM),y)

# This is usually the default *unless* ROOTFS_ISO9660_USE_INITRD is selected.
# In which case, it uses a temporary directory that just gets the kernel and
# initrd put into it. This hack makes the ISO have the whole root fs on it
# despite the fact that we're using an initrd.
ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)

# By default ROOTFS_CPIO_CMD cds into the target then pipes `find .` into cpio
# This allows us to specify a very small subset of files to grab from the root fs.
define ROOTFS_CPIO_CMD
	cd $(TARGET_DIR) && cat \
		$(BR2_EXTERNAL_BUS_INFO_BOARD_PATH)/board/livecd/initrd_filelist \
		| cpio --quiet -o -H newc > $@
endef

# Use our init instead of the one in fs/cpio/init
define ROOTFS_CPIO_ADD_INIT
	if [ ! -e $(TARGET_DIR)/init ]; then \
		$(INSTALL) -m 0755 $(BR2_EXTERNAL_BUS_INFO_BOARD_PATH)/board/livecd/init \
		$(TARGET_DIR)/init; \
	fi
endef
endif
