### Select the GPU to use

```
export CUDA_VISIBLE_DEVICES="0,1"  # requests GPUs 0 and 1
```

GPUs are generally set up in "process exclusive" mode. Only one process can use them at a time.


### Check current GPU utilization

```
nvidia-smi
```