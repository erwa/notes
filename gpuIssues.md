### `Failed to initialize NVML: Driver/library version mismatch`

```
$ nvidia-smi
Failed to initialize NVML: Driver/library version mismatch
```

Previously had 375.26 installed before installed CUDA 9.1 and cuDNN 7.0.5.

Try restarting computer.

Previously had nvidia-375.26-1.x86_64 installed in addition to nvidia-driver-devel-410.72-1.el7.x86_64.

```
sudo yum erase nvidia-375.26-1.x86_64
```

Afterward, nvidia-smi returns `410.72`.