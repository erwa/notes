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