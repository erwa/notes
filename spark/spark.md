### Spark Shell progress

```
(numCompletedTasks + numActiveTasks) / totalNumOfTasksInThisStage
(53 + 10) / 2542
```

https://stackoverflow.com/questions/30245180/what-do-the-numbers-on-the-progress-bar-mean-in-spark-shell


### Client vs. Cluster mode

In client / yarn-client mode, Driver (which instantiates SparkContext) runs in same process as client that submits the application. Application master only used for requesting resources from YARN.

In cluster mode, Driver runs on worker process (generally the Application Master) in cluster, and client exits as soon as it submits the application (without waiting for it to finish)

* https://stackoverflow.com/questions/20793694/what-is-yarn-client-mode-in-spark
* https://spark.apache.org/docs/latest/running-on-yarn.html
* https://stackoverflow.com/questions/37027732/spark-standalone-differences-between-client-and-cluster-deploy-modes


### Spark SQL

Can execute SQL directly:
```
// .sql returns a DataFrame
val sqlDF = spark.sql("SELECT * FROM people")

// Hive UDFs can be used but need to be registered first
// and need to be present in your classpath
```

or use Scala API

```
df.select(...).filter(...).groupBy(...)
```

https://github.com/apache/spark/blob/master/examples/src/main/scala/org/apache/spark/examples/sql/SparkSQLExample.scala

No matter what, a jar needs to be generated and submitted.

Performance overhead:
- in-memory Spark representation needs to be converted to Hive object, Hive UDF applied, then converted back
- same with Scala UDF, in-memory representation converted to simple Scala objects, then converted back. Theoretically, could write a Scala UDF that operates directly on in-memory representation but difficult.


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