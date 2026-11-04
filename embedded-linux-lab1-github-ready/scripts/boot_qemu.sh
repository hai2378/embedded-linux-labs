#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for f in zImage vexpress-v2p-ca9.dtb initramfs.cpio.gz; do
  if [ ! -f "$ROOT/output/$f" ]; then
    echo "Missing original artefact: output/$f" >&2
    exit 1
  fi
done
exec qemu-system-arm \
  -M vexpress-a9 -cpu cortex-a9 -m 512M -smp 2 -nographic \
  -kernel "$ROOT/output/zImage" \
  -dtb "$ROOT/output/vexpress-v2p-ca9.dtb" \
  -initrd "$ROOT/output/initramfs.cpio.gz" \
  -append 'console=ttyAMA0,115200 rdinit=/sbin/init mem=512M'
