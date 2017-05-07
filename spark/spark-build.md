### Spark 2.1.0 Build

Takes about 22 minutes to build from cold start with clean.


### Hive dependency
Spark 1.6 and 2.x depend on Hive 1.2.1. Spark published its own Hive jars to Maven Central. Spark builds against org.spark-project.hive Hive jars. Their version is always "1.2.1.spark2".



### Run doc-jar goal for core module
```
mvn -pl core scala:doc-jar

# Run scalastyle check on doc-jar
mvn -pl core scalastyle:check
```



### Build one module

If building from module directory, copy `scalastyle-config.xml` into that module directory.

http://stackoverflow.com/questions/29435470/spark-1-3-0-building-examples-failed-to-execute-goal-org-scalastyle