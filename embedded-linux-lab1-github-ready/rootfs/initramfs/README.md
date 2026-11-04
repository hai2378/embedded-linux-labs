# Rootfs skeleton recovered from the Gemini conversation

This folder includes only the small text files shown in the Lab 1 chat. It does **not** include the original ARM BusyBox executable, symlinks, special `/dev` device nodes, or complete rootfs. It is not bootable as provided.

To reproduce the original initramfs, install the actual BusyBox build, create standard directories and `/dev` nodes, then package with `cpio -H newc` and `gzip` on Ubuntu.
