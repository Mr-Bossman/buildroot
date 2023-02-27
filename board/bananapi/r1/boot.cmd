#loadkernel fatload usb 0 \$kernel_addr_r uImage setenv fdt_high ffffffff
fatload mmc 0 $kernel_addr_r uImage
fatload mmc 0 $fdt_addr_r sun7i-a20-lamobo-r1.dtb
fatload mmc 0 $ramdisk_addr_r rootfs.cpio.uImage
setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/ram0 rw rootwait
bootm $kernel_addr_r $ramdisk_addr_r $fdt_addr_r
