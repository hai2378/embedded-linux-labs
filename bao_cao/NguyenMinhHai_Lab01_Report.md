# Embedded Linux Lab 1 Report: Building an Embedded Linux System from Source

* **Student Name:** Nguyễn Minh Hải
* **Target Architecture:** ARMv7 / Cortex-A9
* **Emulation Platform:** QEMU `vexpress-a9`
* **Linux Kernel Version:** 5.15

---

## 1. Introduction
Embedded Linux Lab 1 focuses on building a minimal, bootable Linux operating system from scratch for a 32-bit ARM processor without using pre-built Linux distributions. The project encompasses cross-compiling the Linux kernel, configuring the U-Boot bootloader, building a static BusyBox userspace, and constructing an initramfs root filesystem.

---

## 2. Build Environment & Toolchain Setup
The project was developed on an Ubuntu host machine using the official ARM cross-compiler toolchain:
```bash
sudo apt update && sudo apt install -y \
    build-essential git bison flex libncurses-dev libssl-dev \
    gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf \
    qemu-system-arm qemu-utils cpio

cd kernel/linux-5.15
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make vexpress_defconfig
make -j$(nproc) zImage dtbs modulesarm-linux-gnueabihf-gcc --versioncd rootfs/initramfs
find . | cpio -H newc -o | gzip > ../../output/initramfs.cpio.gz
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /tmp
/bin/shqemu-system-arm \
  -M vexpress-a9 \
  -cpu cortex-a9 \
  -m 512M \
  -smp 2 \
  -nographic \
  -kernel output/zImage \
  -dtb output/vexpress-v2p-ca9.dtb \
  -initrd output/initramfs.cpio.gz \
  -append "console=ttyAMA0,115200 rdinit=/sbin/init mem=512M"
