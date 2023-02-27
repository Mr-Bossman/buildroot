#!/bin/sh
MKIMAGE=$HOST_DIR/bin/mkimage
$MKIMAGE -A arm -O linux -T kernel -C none -a 0x40008000 -e 0x40008000 -n "Linux kernel" -d $BINARIES_DIR/zImage $BINARIES_DIR/uImage
$MKIMAGE -A arm -O linux -T ramdisk -C none -a 0x43400000 -n "Root Filesystem" -d $BINARIES_DIR/rootfs.cpio $BINARIES_DIR/rootfs.cpio.uImage

support/scripts/genimage.sh -c $2
