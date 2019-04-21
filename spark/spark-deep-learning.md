### Apply TensorFlow graph to Spark DataFrame

Use a TFTransformer. Uses TensorFlow data feeding.

https://github.com/databricks/spark-deep-learning#for-tensorflow-users-1
https://github.com/databricks/spark-deep-learning/blob/master/python/sparkdl/transformers/tf_tensor.py


### TensorFlow integration

They have transformers that allow you to apply a TF graph to a Spark DataFrame.

Note that `sess.run()` is never called inside the `with` block.

```
from pyspark.ml.image import ImageSchema
from sparkdl import TFImageTransformer
import sparkdl.graph.utils as tfx  # strip_and_freeze_until was moved from sparkdl.transformers to sparkdl.graph.utils in 0.2.0
from sparkdl.transformers import utils
import tensorflow as tf

graph = tf.Graph()
with tf.Session(graph=graph) as sess:
    image_arr = utils.imageInputPlaceholder()
    resized_images = tf.image.resize_images(image_arr, (299, 299))
    # the following step is not necessary for this graph, but can be for graphs with variables, etc
    frozen_graph = tfx.strip_and_freeze_until([resized_images], graph, sess, return_graph=True)

transformer = TFImageTransformer(inputCol="image", outputCol="predictions", graph=frozen_graph,
                                 inputTensor=image_arr, outputTensor=resized_images,
                                 outputMode="image")

image_df = ImageSchema.readImages(sample_img_dir)
processed_image_df = transformer.transform(image_df)
```

https://github.com/databricks/spark-deep-learning#for-tensorflow-users