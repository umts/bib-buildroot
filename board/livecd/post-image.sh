#!/bin/sh
# Virtualbox doesn't believe an .iso9660 file is an ISO
ln -sf "rootfs.iso9660" "${BINARIES_DIR}/rootfs.iso"
