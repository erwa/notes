### Distributed `TF_CONFIG`

```
# chief worker
TF_CONFIG='{
    "cluster": {
        "chief": ["host0:2222"],
        "worker": ["host1:2222", "host2:2222", "host3:2222"],
        "ps": ["host4:2222", "host5:2222"]
    },
    "task": {"type": "chief", "index": 0}
}'

# non-chief worker
TF_CONFIG='{
    "cluster": {
        "chief": ["host0:2222"],
        "worker": ["host1:2222", "host2:2222", "host3:2222"],
        "ps": ["host4:2222", "host5:2222"]
    },
    "task": {"type": "worker", "index": 0}
}'

# ps
TF_CONFIG='{
    "cluster": {
        "chief": ["host0:2222"],
        "worker": ["host1:2222", "host2:2222", "host3:2222"],
        "ps": ["host4:2222", "host5:2222"]
    },
    "task": {"type": "ps", "index": 0}
}'

# evaluator
TF_CONFIG='{
    "cluster": {
        "chief": ["host0:2222"],
        "worker": ["host1:2222", "host2:2222", "host3:2222"],
        "ps": ["host4:2222", "host5:2222"]
    },
    "task": {"type": "evaluator", "index": 0}
}'
```

https://www.tensorflow.org/api_docs/python/tf/estimator/train_and_evaluate


### Simple end-to-end code

https://github.com/tensorflow/tensorboard/issues/1642

```
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

from threading import Thread

import logging
import os
import tensorboard.main as tb_main
import tensorflow as tf

# Environment variable containing port to launch TensorBoard on, set by TonY.
TB_PORT_ENV_VAR = 'TB_PORT'

tf.flags.DEFINE_string('data_dir', '/tmp/tensorflow/mnist/input_data',
                           'Directory for storing input data')
tf.flags.DEFINE_string('working_dir', '/tmp/tensorflow/mnist/working_dir',
                           'Directory under which events and output will be stored (in separate subdirectories).')

# Training parameters
tf.flags.DEFINE_integer("steps", 2500, "The number of training steps to execute.")
tf.flags.DEFINE_integer("batch_size", 64, "The batch size per step.")

FLAGS = tf.flags.FLAGS


def start_tensorboard(checkpoint_dir):
  FLAGS.logdir = checkpoint_dir
  if TB_PORT_ENV_VAR in os.environ:
    FLAGS.port = os.environ[TB_PORT_ENV_VAR]
  tb_thread = Thread(target=tb_main.run_main)
  tb_thread.daemon = True

  logging.info(
    "Starting TensorBoard with --logdir=" + checkpoint_dir + " in daemon "
                                                             "thread...")
  tb_thread.start()


def main(_):
  # Create some variables.
  start_tensorboard(FLAGS.working_dir)
  v1 = tf.get_variable("v1", shape=[3], initializer=tf.zeros_initializer)
  v2 = tf.get_variable("v2", shape=[5], initializer=tf.zeros_initializer)

  inc_v1 = v1.assign(v1 + 1)
  dec_v2 = v2.assign(v2 - 1)

  # Add an op to initialize the variables.
  init_op = tf.global_variables_initializer()

  # Add ops to save and restore all the variables.
  saver = tf.train.Saver()

  # Later, launch the model, initialize the variables, do some work, and save
  #  the
  # variables to disk.
  with tf.Session() as sess:
    sess.run(init_op)
    # Do some work with the model.
    inc_v1.op.run()
    dec_v2.op.run()
    # Save the variables to disk.
    save_path = saver.save(sess, "/tmp/model.ckpt")
    print("Model saved in path: %s" % save_path)


if __name__ == '__main__':
  tf.app.run()
```


### Layer Function shortcuts

```
x = tf.placeholder(tf.float32, shape=[None, 3])
linear_model = tf.layers.Dense(units=1)  # allows for Layer reuse
y = linear_model(x)
```

```
x = tf.placeholder(tf.float32, shape=[None, 3])
y = tf.layers.dense(x, units=1)
```

https://www.tensorflow.org/guide/low_level_intro#layers


### Layers

Layers contain variables that must be initialized before use. You can globally initialize all variables by doing:

```
init = tf.global_variables_initializer()  # returns handle to operation
sess.run(init)  # will trigger initialization of all global variables
```

https://www.tensorflow.org/guide/low_level_intro#initializing_layers


### Read HDFS Data / Hadoop Support

```
# assumes HADOOP_HDFS_HOME env var is set and libhdfs.so exists in
# $HADOOP_HDFS_HOME/lib/native
# if not, add location of libhdfs.so to LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/java/default/jre/lib/amd64/server
CLASSPATH=$(${HADOOP_HOME}/bin/hadoop classpath --glob) bin/python my_program.py
```

https://www.tensorflow.org/deploy/hadoop


### Running TensorFlow on YARN

http://mail-archives.apache.org/mod_mbox/hadoop-yarn-dev/201811.mbox/raw/%3C199680590.113715.1541566813031%40mail.yahoo.com%3E/1


### TensorFlow PyPI Package

Compatible with RHEL7 but not RHEL6.


### TensorFlowHub

```
wget 'https://tfhub.dev/google/nnlm-en-dim128/1?tf-hub-format=compressed' -O nnlm.tar.gz
```

https://github.com/tensorflow/hub/issues/53


### Dataset API

Dataset --> tf.data.Iterator --> .get_next() --> tf.Tensor you can run.


### Dataset API examples

```
my_data = [
    [0, 1,],
    [2, 3,],
    [4, 5,],
    [6, 7,],
]
slices = tf.data.Dataset.from_tensor_slices(my_data)
next_item = slices.make_one_shot_iterator().get_next()
```

https://www.tensorflow.org/guide/low_level_intro#datasets


```
features, labels = (np.random.sample((100,2)), np.random.sample((100,1)))
dataset = tf.data.Dataset.from_tensor_slices((features,labels))
```

https://towardsdatascience.com/how-to-use-dataset-in-tensorflow-c758ef9e4428


```
import tensorflow as tf
from tensorflow.data import Dataset

dataset = Dataset.from_tensor_slices((tf.constant([1, 2]), tf.constant([3, 4])))
x = dataset.make_one_shot_iterator()

with tf.Session() as sess:
    while True:
        try:
            elem = x.get_next()
            print(sess.run(elem))
        except:
            break

# (1, 3)
# (2, 4)
```

```
import tensorflow as tf
from tensorflow.data import Dataset

dataset = Dataset.range(5)
x = dataset.make_one_shot_iterator()

with tf.Session() as sess:
    while True:
        try:
            elem = x.get_next()
            print(sess.run(elem))
        except:
            break

# 0
# 1
# 2
# 3
# 4
```

```
import tensorflow as tf
from tensorflow.data import Dataset

dataset = Dataset.from_tensors((tf.constant(1), tf.constant(2)))

x = dataset.make_one_shot_iterator()
elem = x.get_next()

with tf.Session() as sess:
  try:
    while True:
      print(sess.run(elem))
  except tf.errors.OutOfRangeError:
    pass

# (1, 2)
```


### NCCL all_sum example

```
import tensorflow as tf
import tensorflow.contrib.nccl as n

graph = None
with tf.device('/device:GPU:0'):
    a = tf.constant(1)
    graph = tf.contrib.nccl.all_sum([a])

with tf.Session() as sess:
    sess.run(graph)
```


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


### Matrix tensor literal

```
c = tf.constant([[1.0, 2.0], [3.0, 4.0]])
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


### Validate installation / test TensorFlow

```
from tensorflow.contrib.autograph import operators

# Python
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
```

https://www.tensorflow.org/install/install_sources#validate_your_installation


### `Session.run()`

You can call `run()` on an Operation, too, to cause a side effect. The result is `None`.

https://www.tensorflow.org/guide/low_level_intro


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
    DATA_SCHEMA = reader.datum_reader.writer_schema  # With "avro" library in Python 2, it is writers_schema
print("Extracted schema: {}".format(DATA_SCHEMA))
```


### Examples

Low-level example:

```
x = tf.constant([[1], [2], [3], [4]], dtype=tf.float32)
y_true = tf.constant([[0], [-1], [-2], [-3]], dtype=tf.float32)

linear_model = tf.layers.Dense(units=1)

y_pred = linear_model(x)
loss = tf.losses.mean_squared_error(labels=y_true, predictions=y_pred)

optimizer = tf.train.GradientDescentOptimizer(0.01)
train = optimizer.minimize(loss)

init = tf.global_variables_initializer()

sess = tf.Session()
sess.run(init)
for i in range(100):
  _, loss_value = sess.run((train, loss))
  print(loss_value)

print(sess.run(y_pred))
```

https://www.tensorflow.org/guide/low_level_intro#complete_program

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


### `feed_dict`

Can be used to provide values for `placeholder` tensors but can also be used to provide values for other tensors. This is good to avoid unnecessary copies.

https://www.tensorflow.org/guide/datasets#consuming_numpy_arrays


### Reading data in Python

Ways of reading data: https://www.tensorflow.org/api_guides/python/reading_data

* tf.data (preferred)
* feeding (via `feed_dict` argument)
* QueueRunner (queue-based input)
* constant or variable that holds all the data


### TFRecords format

Sequence of binary strings.

https://www.tensorflow.org/api_guides/python/python_io#tfrecords_format_details