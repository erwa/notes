### Feed in Spark RDD

There is performance penalty in reading data from disk through Spark RDD and then into TensorFlow. For efficiency, TensorFlow should directly read data from disk.

https://github.com/yahoo/TensorFlowOnSpark/blob/master/examples/mnist/mnist_spark.ipynb