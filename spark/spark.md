### IntelliJ setup

Enable hadoop-2.7 and yarn profiles. Enabling yarn profile is needed for spark-yarn module.


### Unit test

```
  @BeforeClass
  def setup() = {
    setupSparkContext()
  }

  private def setupSparkContext() = {
    val conf = new SparkConf()
      .setMaster("local")
      .setAppName(this.getClass.getName)
    _sc = new SparkContext(conf)
  }

  @AfterClass
  def cleanup() = {
    if (_sc != null) {
      _sc.stop()
    }
  }
```

http://mkuthan.github.io/blog/2015/03/01/spark-unit-testing/


### Hive fork source code

https://github.com/JoshRosen/hive/tree/release-1.2.1-spark2

Ref: http://markmail.org/message/ngnnzpypohp57tpg


### Alter schema of DataFrame

```
//
val newSchema = StructType(Seq(
  StructField("field1", IntegerType, /* nullable */ false),
  StructField("field2", IntegerType, false)
))

// apply new schema
df.sqlContext.createDataFrame( df.rdd, newSchema )
```

https://stackoverflow.com/questions/33193958/change-nullable-property-of-column-in-spark-dataframe


### Add literal fields

```
// Spark 2.2+
import org.apache.spark.sql.functions.typedLit

df.withColumn("some_array", typedLit(Seq(1, 2, 3)))
df.withColumn("some_struct", typedLit(("foo", 1, .0.3)))
df.withColumn("some_map", typedLit(Map("key1" -> 1, "key2" -> 2)))

// Spark 2.0+
df.withColumn("map", map(lit("key1"), lit(1), lit("key2"), lit(2)))
```

https://stackoverflow.com/questions/32788322/how-to-add-a-constant-column-in-a-spark-dataframe


### Rename column

```
df.select($"_1".alias("x1"))
```

https://stackoverflow.com/questions/35592917/renaming-column-names-of-a-data-frame-in-spark-scala


### Transform DataFrame

```
import org.apache.spark.sql.functions._
df.select(lit("constant_column"), col("existing_column"), ...)
```


### Remove column

```
df.remove("my_col")
```

https://stackoverflow.com/questions/35999399/spark-1-6-drop-column-in-dataframe-with-escaped-column-names


### Rearrange columns in DataFrame

```
cols = df.columns.tolist()
cols = cols[-1:] + cols[:-1]
df = df[cols]
```

https://stackoverflow.com/questions/13148429/how-to-change-the-order-of-dataframe-columns


### Concat two columns

```
df.select(concat($"col1", lit(","), $"col2"))
```

https://stackoverflow.com/questions/31450846/concatenate-columns-in-apache-spark-dataframe


### Print DataFrame without truncating

```
df.show(numRows, /* truncate */ False)
```

https://stackoverflow.com/questions/33742895/how-to-show-full-column-content-in-a-spark-dataframe


### Cross join / cross product

```
val crossJoined = df1.crossJoin(df2)
```

https://stackoverflow.com/questions/42158598/how-to-cross-join-2-dataframe


### Create DataFrame from List

```
val values = List(1,2,3,4,5)
val df = values.toDF()
```

https://stackoverflow.com/questions/38063195/how-to-create-dataframe-from-scalas-list-of-iterables


### What is a DataFrame

```
type DataFrame = Dataset[Row]
```

Defined in org.apache.spark.sql/package.scala.


### Coalesce vs. repartition

Coalesce avoids full shuffle, can be used only to decrease number of partitions. However, Spark SQL engine may push the number of partitions specified into a previous shuffle operation, so be wary.

https://stackoverflow.com/questions/31610971/spark-repartition-vs-coalesce


### One output file

```
.coalesce(1)
```

https://stackoverflow.com/questions/31674530/write-single-csv-file-using-spark-csv


### One file per partition

```
df.repartition(col("partition_col")).write.partitionBy("partition_col").save("/path")
```

https://stackoverflow.com/questions/34789604/dataframe-partitionby-to-a-single-parquet-file-per-partition


### Write partitioned output

```
df.write.format("csv").option("header", "true").partitionBy("id").save("/output/path")
```


### Add constant column

```
// lit() comes from import org.apache.spark.sql.functions._
val df3 = df2.withColumn("lead", lit("lead"))
```

https://stackoverflow.com/questions/32788322/how-to-add-a-constant-column-in-a-spark-dataframe


### Write Avro file

```
import com.databricks.spark.avro._
df.write.avro("/path/to/output")

// Alternative
df.write.format("com.databricks.spark.avro").save("/path/to/output/dir")
```

https://stackoverflow.com/questions/33878433/spark-write-avro-file


### Union to struct

spark-avro implicitly converts union to struct.


### Read Avro file

Include com.databricks:spark-avro_2.11:3.2.0 in packages list.

```
val df = spark.read.format("com.databricks.spark.avro").load("/path/to/avro/dir/")
```

https://stackoverflow.com/questions/45360359/reading-avro-file-in-spark


### Load CSV

```
val df = spark.sql("SELECT * FROM csv.`/path/to/csv/dir`")
```

https://stackoverflow.com/questions/29704333/spark-load-csv-file-as-dataframe


### Map vs. flat map

Map transforms collection of size N to collection of size N. Flat map transforms collection of size N into N collections and combines those collections.


### Spark Shell progress

```
(numCompletedTasks + numActiveTasks) / totalNumOfTasksInThisStage
(53 + 10) / 2542
```

https://stackoverflow.com/questions/30245180/what-do-the-numbers-on-the-progress-bar-mean-in-spark-shell


### Class vs. object

Spark application must be object rather than class, or else you will get an NPE.

https://www.hackingnote.com/en/spark/trouble-shooting/Driver-NullPointerException/


### Spark shell

Standalone Spark application. Includes the driver. Driver acts as "master node" in Spark application.

https://jaceklaskowski.gitbooks.io/mastering-apache-spark/spark-shell.html
https://jaceklaskowski.gitbooks.io/mastering-apache-spark/spark-driver.html


### Client vs. Cluster mode

In client / yarn-client mode, Driver (which instantiates SparkContext) runs in same process as client that submits the application. Application master only used for requesting resources from YARN. For a Spark shell, the driver runs on the same machine as the shell.

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

Print launch command:

```
export SPARK_PRINT_LAUNCH_COMMAND=true

# To enable more logging
spark-shell --verbose
```

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