### Upstream contributions and builds

Contributions happen on GitHub as Pull Requests. Pull request builds happen on Amplab's Jenkins server: https://amplab.cs.berkeley.edu/jenkins/job/SparkPullRequestBuilder/


### SparkLauncher

SparkLauncher class is ultimately just starting a new process that invokes bin/spark-submit.


### Reducing Build Times
http://spark.apache.org/developer-tools.html#reducing-build-times


### Test failures
In logs, search for `*** FAILED ***` and `TESTS FAILED`.


### Testing

All Spark applications launched as child processes. No in-process execution.


### Logs

To see executor logs, go to "tracking URL" -> Executors


### Submitting Spark Job
```
# using spark-shell
$ spark-shell

scala> :load PATH_TO_FILE
```
http://stackoverflow.com/questions/27717379/spark-how-to-run-spark-file-from-spark-shell

# using spark-submit
spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master yarn \
  --deploy-mode cluster \  # can be client for client mode
  --executor-memory 20G \
  --num-executors 50 \
  /path/to/examples.jar \
  1000
```


### RDD Operations

Transformations are lazy. Example: map, filter
Actions trigger execution. Example: reduce, reduceByKey

http://stackoverflow.com/questions/31383904/how-can-i-force-spark-to-execute-code