### How to run distributed MNIST example

https://github.com/linkedin/TonY/blob/master/tony-examples/mnist-tensorflow/mnist_distributed.py

Parameter server

```
# activate venv

export CLUSTER_SPEC='{"ps": ["localhost:2222"], "worker": ["localhost:2223"]}'
export JOB_NAME=ps
export TASK_INDEX=0

python /path/to/mnist_distributed.py
```

Worker

```
# activate venv

export CLUSTER_SPEC='{"ps": ["localhost:2222"], "worker": ["localhost:2223"]}'
export JOB_NAME=worker
export TASK_INDEX=0

python /path/to/mnist_distributed.py
```