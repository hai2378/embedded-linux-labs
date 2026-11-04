# Lab 1 — build notes (commands documented in the supplied chat)

This is a **reference sequence**, not an executed build script. Use actual source trees and review the selected toolchain first.

1. Download/extract Kernel 5.15, U-Boot 2022.04 and BusyBox 1.35.0 into `~/embedded_lab1`.
2. Configure ARM Kernel via `make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- vexpress_defconfig` and adjust `menuconfig` if needed.
3. Build: `make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j$(nproc) zImage dtbs`.
4. Configure/build U-Boot with `vexpress_ca9x4_defconfig` and the matching cross-compiler.
5. Build BusyBox statically, populate initramfs directories and `/dev` nodes, and package with `find . -print0 | cpio --null -o -H newc | gzip`.
6. Test QEMU using `scripts/boot_qemu.sh` after actual binaries have been copied to `output/`.

**Important:** An earlier hard-float Kernel build in the conversation encountered a VDSO ABI error; the Kernel was subsequently built with `arm-linux-gnueabi-`. Do not assume hard-float and soft-float binaries are interchangeable. Lab 1 artefacts are not bundled in this reconstructed repository.
