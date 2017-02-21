ifeq ($(BUS_INFO_BOARD_ROOTFS_ISO9660_HYBRID_INITRD_SHIM),y)
ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)

define ROOTFS_CPIO_CMD
	cd $(TARGET_DIR) && cat \
		$(BR2_EXTERNAL_BUS_INFO_BOARD_PATH)/board/livecd/initrd_filelist \
		| cpio --quiet -o -H newc > $@
endef

define ROOTFS_CPIO_ADD_INIT
	if [ ! -e $(TARGET_DIR)/init ]; then \
		$(INSTALL) -m 0755 $(BR2_EXTERNAL_BUS_INFO_BOARD_PATH)/board/livecd/init \
		$(TARGET_DIR)/init; \
	fi
endef
endif
