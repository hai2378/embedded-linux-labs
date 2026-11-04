# Lab 01 report — Kernel, U-Boot, BusyBox and QEMU

**Platform:** QEMU `vexpress-a9`, ARM Cortex-A9; Linux 5.15; U-Boot 2022.04; BusyBox 1.35.0.

## Objective
Configure and build a minimal embedded Linux system for ARMv7, construct an initramfs and demonstrate boot on QEMU.

## Activities documented in the Gemini conversation
- Cross-compile the Linux Kernel and Device Tree (`zImage`, `vexpress-v2p-ca9.dtb`).
- Compile and test U-Boot 2022.04 in QEMU.
- Build a static BusyBox, create init/inittab/rcS and package an initramfs.
- Boot QEMU with kernel + DTB + initramfs and inspect the BusyBox shell (`uname`, `mount`, `ps`, `/proc/cpuinfo`).

## Observations
The conversation reports successful boot into an interactive BusyBox shell. It also records an earlier Kernel panic without a usable root filesystem and a hard-float VDSO build issue, later addressed by switching toolchains.

## Evidence limitation
This reconstructed repository does **not** contain actual Kernel/U-Boot/BusyBox binaries, full original configuration files or raw runtime logs. Add them from Ubuntu when available. See the accompanying Word report for the narrative.
