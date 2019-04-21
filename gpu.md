### Check if machine has GPUs

```
lspci
```

https://askubuntu.com/questions/5417/how-to-get-the-gpu-info


### Check CUDA version

```
nvcc --version

cat /usr/local/cuda/version.txt
```

https://stackoverflow.com/questions/9727688/how-to-get-the-cuda-version


### Check cuDNN version

From Python

```
from ctypes import cdll
cudnn = cdll.LoadLibrary('libcudnn.so.7')
cudnn.cudnnGetVersion()
```

https://stackoverflow.com/questions/48566505/how-can-i-check-if-keras-tensorflow-is-using-cudnn

```
$ cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
#define CUDNN_MAJOR 7
#define CUDNN_MINOR 0
#define CUDNN_PATCHLEVEL 5

# Above indicates 7.0.5 was installed
```

https://stackoverflow.com/questions/31326015/how-to-verify-cudnn-installation


### Select the GPU to use

```
export CUDA_VISIBLE_DEVICES="0,1"  # requests GPUs 0 and 1
```

GPUs are generally set up in "process exclusive" mode. Only one process can use them at a time.


### Check current GPU utilization / Check GPU model and driver version

```
nvidia-smi
```