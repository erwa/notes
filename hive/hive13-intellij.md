### IntelliJ setup
Open the root pom.xml in IntelliJ.
```
File -> Open -> pom.xml
```

View -> Tool Windows -> Maven Projects -> Profiles -> Check the "hadoop-2" and "maven-3" profiles.

You should now be able to build the entire project in IntelliJ and debug tests.

Unable to fix the `org.datanucleus.exceptions.ClassNotPersistableException: The
class "org.apache.hadoop.hive.metastore.model.MVersionTable"` issue: http://mail-archives.apache.org/mod_mbox/hive-user/201506.mbox/%3CCANKHNWSfKLMMbTCqfxcqj21_WH1sjFL1jrf1GKY1eS=Erf9gXg@mail.gmail.com%3E

Change itests/util's dependency on hive-shims-0.23 from Runtime to Compile Scope.

Running tests in IntelliJ. To work around DataNucleus "MVersionTable is not persistable" error, update qtest module (hive-it-qfile) to have a Test dependency on hive-metastore jar and move the priority above <Module source>.

To fix "Error: HIVE_HADOOP_TEST_CLASSPATH not defined.", added an environment variable `HIVE_HADOOP_TEST_CLASSPATH` set to the output of `hadoop classpath`. Issue with this approach is Hadoop job will be launched in separate process, and you can't debug easily. Need to backport HIVE-7271 (fixed in 0.14.0).