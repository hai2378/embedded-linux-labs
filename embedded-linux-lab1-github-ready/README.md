# Embedded Linux Lab 1 — ARMv7 Linux Boot on QEMU

## Overview

This repository documents **Lab 01: Embedded Linux System Bring-up** on the QEMU Versatile Express Cortex-A9 board (`vexpress-a9`). The workflow described in the original lab conversation covers Linux Kernel 5.15, U-Boot 2022.04, BusyBox 1.35.0, and an initramfs root filesystem.

**Provenance:** This GitHub-ready collection is **reconstructed from the 160-page exported Gemini conversation**, not a byte-for-byte copy of the original Ubuntu folder. The conversation reports the kernel, U-Boot, BusyBox and initramfs work as completed, including successful QEMU boot. Original binary artefacts, full `.config` files, and standalone terminal logs were not provided in the exported PDF and are therefore **not included**.

## Repository contents

| Path | Contents |
|---|---|
| `bao_cao/` | Lab 1 report in Markdown and Word |
| `configs/` | Guide for adding real Kernel/BusyBox config files |
| `output/` | Guide for adding actual zImage, DTB, U-Boot and initramfs |
| `rootfs/initramfs/` | Reconstructed init and boot scripts (not a bootable rootfs without BusyBox) |
| `scripts/` | QEMU boot command and build notes |
| `logs/` | List of missing terminal evidence |

## Target environment

- QEMU machine: `vexpress-a9` (ARM Cortex-A9, ARMv7-A)
- Memory: 512 MiB; console: `ttyAMA0`
- Linux Kernel: `5.15`
- U-Boot: `2022.04`
- BusyBox: `1.35.0`
- Cross toolchain: `arm-linux-gnueabi-` was used for the working Kernel build in the recorded workflow; earlier `gnueabihf` attempts were also discussed

## Build and boot workflow

1. Configure and cross-build the ARM Linux Kernel (zImage + Device Tree).
2. Configure and build U-Boot for Versatile Express.
3. Build a static BusyBox and prepare the root filesystem.
4. Package the root filesystem into a CPIO+gzip archive.
5. Boot with `qemu-system-arm`, the zImage, device tree and initramfs.

The example start command is in [`scripts/boot_qemu.sh`](scripts/boot_qemu.sh). It requires **real output binaries** to be placed in `output/` first.

## Documented observations

The exported conversation describes successful BusyBox boot with the prompt `/ #`, and checks involving `uname -a`, `/proc/cpuinfo`, `/proc/meminfo`, `mount`, and `ps`. It also discusses an earlier kernel panic when the root filesystem was absent. These are **transcript-reported observations**, not independently regenerated logs.

## Evidence to add from Ubuntu

- `configs/kernel.config` and `configs/busybox.config`
- `output/zImage`, `output/vexpress-v2p-ca9.dtb`, `output/u-boot`, `output/initramfs.cpio.gz`
- Raw boot/build logs or screenshots

## Reproduction

See [`scripts/build_notes.md`](scripts/build_notes.md). Toolchain and build settings must match the actual Ubuntu host and selected Kernel tree.
