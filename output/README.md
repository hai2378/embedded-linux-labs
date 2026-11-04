# Runtime binary outputs not included

The original Gemini dialogue reports that these were built, but the exported chat PDF did not contain their bytes:

- `zImage` (Linux 5.15 kernel)
- `vexpress-v2p-ca9.dtb` (Device Tree)
- `u-boot` (U-Boot 2022.04)
- `initramfs.cpio.gz` (BusyBox root filesystem)

To make this repository bootable, copy the **actual** outputs from `~/embedded_lab1/output/` on Ubuntu. GitHub's web upload has individual file size limits; do not upload the full Kernel source tree.
