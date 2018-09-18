### Disable GPU

```
os.environ["CUDA_VISIBLE_DEVICES"]="-1"
```

https://stackoverflow.com/questions/44552585/prevent-tensorflow-from-accessing-the-gpu


### Print version

```
import tensorflow as tf

print(tf.__version__)
```


### Test GPU

```
import tensorflow as tf

# Creates a graph.
with tf.device('/cpu:0'):
  a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
  b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')

c = tf.matmul(a, b)
# Creates a session with log_device_placement set to True.
sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
# Runs the op.
print(sess.run(c))
```

Output should show matmul was done on GPU.

https://www.tensorflow.org/guide/using_gpu


### Validate installation

```
# Python
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
```

https://www.tensorflow.org/install/install_sources#validate_your_installation


### Eager execution

Evaluate operations immediately.

```
import tensorflow as tf

tf.enable_eager_execution()
```

https://www.tensorflow.org/guide/eager


### Get shape of tensor

```
my_tensor.shape
```

https://www.tensorflow.org/guide/tensors#getting_a_tftensor_objects_shape


### Using GFile

```
import os
import avro.datafile
import avro.io

remote_avro_file = "hdfs://default/path/to/foo.avro"
with tf.gfile.Open(remote_avro_file, 'rb') as gfile:
    reader = avro.datafile.DataFileReader(gfile, avro.io.DatumReader())
    DATA_SCHEMA = reader.datum_reader.writers_schema
print("Extracted schema: {}".format(DATA_SCHEMA))
```


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


### Lighter colors in TensorBoard

They show percentiles. The darkest color is the median.

https://stackoverflow.com/questions/47735846/what-does-lighter-color-mean-in-tensorboard


### Load multiple runs, log directories in TensorBoard

```
tensorboard --logdir=name1:/path/to/logs/1,name2:/path/to/logs/2
```

TensorBoard also scans subdirectories.

https://stackoverflow.com/questions/36182380/how-do-display-different-runs-in-tensorboard


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