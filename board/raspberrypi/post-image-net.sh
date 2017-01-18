#!/bin/sh

GENIMAGE_CFG="${BR2_EXTERNAL_BUS_INFO_BOARD_PATH}/board/raspberrypi/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

# Mark the kernel as DT-enabled
mkdir -p "${BINARIES_DIR}/kernel-marked"
${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
	"${BINARIES_DIR}/kernel-marked/zImage"

# Make U Boot boot script
${HOST_DIR}/usr/bin/mkimage -A arm -T script -C none -n 'Boot script' -d \
  "${BR2_EXTERNAL_BUS_INFO_BOARD_PATH}/board/raspberrypi/boot.scr" \
  "${BINARIES_DIR}/boot.scr.uimg"

# Put our config.txt and cmdline.txt in place
cp "${BR2_EXTERNAL_BUS_INFO_BOARD_PATH}/board/raspberrypi/net-config.txt" \
  "${BINARIES_DIR}/config.txt"
cp "${BR2_EXTERNAL_BUS_INFO_BOARD_PATH}/board/raspberrypi/net-cmdline.txt" \
  "${BINARIES_DIR}/cmdline.txt"

rm -rf "${GENIMAGE_TMP}"

genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
