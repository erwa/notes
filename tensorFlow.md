### Examples

See [tensorflow/examples](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples).

```
# Download MNIST dataset (.gz files) and put in `/tmp/tensorflow/mnist/input_data`.

# Install and activate virtualenv with tensorflow and copy mnist_deep.py into venv's lib/python2.7/site-packages/tensorflow/examples/tutorials/mnist
# https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/tutorials/mnist/mnist_deep.py

cd lib/python2.7/site-packages/tensorflow/examples/tutorials/mnist
python mnist_deep.py
```

Distributed:

```
# 1 ps, 1 worker
python mnist_distributed.py --cluster_spec='{"ps": ["localhost:2222"], "worker": ["localhost:2223"]}' --is_worker --job_name=ps --task_index=0

python mnist_distributed.py --cluster_spec='{"ps": ["localhost:2222"], "worker": ["localhost:2223"]}' --is_worker --job_name=worker --task_index=0


# 1 ps, 2 workers
python mnist_distributed.py --cluster_spec='{"ps": ["localhost:2222"], "worker": ["localhost:2223", "localhost:2224"]}' --job_name=ps --task_index=0 --is_worker

python mnist_distributed.py --cluster_spec='{"ps": ["localhost:2222"], "worker": ["localhost:2223", "localhost:2224"]}' --job_name=worker --task_index=0 --is_worker

python mnist_distributed.py --cluster_spec='{"ps": ["localhost:2222"], "worker": ["localhost:2223", "localhost:2224"]}' --job_name=worker --task_index=1 --is_worker
```


### Supervisor vs. MonitoredTrainingSession

`tf.train.Supervisor` is deprecated. Use `tf.train.MonitoredTrainingSession` instead.

https://www.tensorflow.org/api_docs/python/tf/train/Supervisor

https://clusterone.com/blog/2017/09/13/distributed-tensorflow-clusterone/


### Starting TensorBoard

```
# logdir should be set to directory with events.out.tfevents.{timestamp}.{host} file
tensorboard --host localhost --logdir=/path/to/directory/with/events/files
tensorboard --host localhost --port 8088 --logdir=.
```

https://stackoverflow.com/questions/40106949/unable-to-open-tensorboard-in-browser


### Installation

https://www.tensorflow.org/install/install_mac

```
sudo pip install virtualenv
virtualenv --system-site-packages .venv2
cd .venv2
source bin/activate
pip install tensorflow

# if pip install tensorflow has issues
pip install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-1.9.0-py2-none-any.whl
```


### Reading data in Python

Ways of reading data: https://www.tensorflow.org/api_guides/python/reading_data

* tf.data (preferred)
* feeding (via `feed_dict` argument)
* QueueRunner (queue-based input)
* constant or variable that holds all the data


### TFRecords format

Sequence of binary strings.

https://www.tensorflow.org/api_guides/python/python_io#tfrecords_format_details