# Original configuration files not included

The exported Gemini conversation contains commands for saving `kernel.config` and `busybox.config`, but not the complete, original config files.

If available on Ubuntu, copy these actual files here:

```bash
cp ~/embedded_lab1/kernel/linux-5.15/.config configs/kernel.config
cp ~/embedded_lab1/rootfs/busybox-1.35.0/.config configs/busybox.config
```

Do not substitute dummy `.config` files for the original build configurations.
