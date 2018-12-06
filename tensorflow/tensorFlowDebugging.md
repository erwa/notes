### Debugging graph issues

Look at the graph in TensorBoard. You should be able to see which node causes the problem, as well as the shape of the tensor.

https://groups.google.com/a/tensorflow.org/forum/?utm_medium=email&utm_source=footer#!msg/discuss/5lKcSgGyuF4/gmPVKBKcAQAJ


### Distributed environment variable setup

```
export CLUSTER_SPEC='{"ps": ["localhost:2222"], "worker": ["localhost:2223"]}'
export JOB_NAME=ps
export TASK_INDEX=0

bin/python ./path/to/mnist_distributed.py


### Worker ###
export CLUSTER_SPEC='{"ps": ["localhost:2222"], "worker": ["localhost:2223"]}'
export JOB_NAME=worker
export TASK_INDEX=0

bin/python ./path/to/mnist_distributed.py
```

https://www.tensorflow.org/api_docs/python/tf/estimator/RunConfig