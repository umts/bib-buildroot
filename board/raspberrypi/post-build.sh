#!/bin/sh
mkdir -p $TARGET_DIR/boot
grep -q 'mmcblk0p1' $TARGET_DIR/fstab || echo '/dev/mmcblk0p1	/boot		vfat	ro,noexec	0	0' >> $TARGET_DIR/etc/fstab
