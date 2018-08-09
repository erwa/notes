### Maven Build

View -> Tools Windows -> Maven

Enable "itests" profile.


### `package org.apache.hive.tmpl does not exist`

hive-service -> add target/generated-jamon as source directory


### Test specific tests, use custom init file

```
diff --git a/itests/util/src/main/java/org/apache/hadoop/hive/cli/control/AbstractCliConfig.java b/itests/util/src/main/java/org/apache/hadoop/hive/cli/control/AbstractCliConfig.java
index c12f51e..4cf4787 100644
--- a/itests/util/src/main/java/org/apache/hadoop/hive/cli/control/AbstractCliConfig.java
+++ b/itests/util/src/main/java/org/apache/hadoop/hive/cli/control/AbstractCliConfig.java
@@ -231,7 +231,7 @@ public boolean accept(File filePath) {
   public Set<File> getQueryFiles() throws Exception {
     prepareDirs();

-    Set<String> includeOnly = includeQueryFileNames;
+    Set<String> includeOnly = Sets.newHashSet("truncate_column_buckets.q");

     // queryDirectory should not be null
     File queryDir = new File(queryDirectory);
diff --git a/itests/util/src/main/java/org/apache/hadoop/hive/cli/control/CliConfigs.java b/itests/util/src/main/java/org/apache/hadoop/hive/cli/control/CliConfigs.java
index af8ec67..b2eed9e 100644
--- a/itests/util/src/main/java/org/apache/hadoop/hive/cli/control/CliConfigs.java
+++ b/itests/util/src/main/java/org/apache/hadoop/hive/cli/control/CliConfigs.java
@@ -57,7 +57,7 @@ public CliConfig() {
         setResultsDir("ql/src/test/results/clientpositive");
         setLogDir("itests/qtest/target/qfile-results/clientpositive");

-        setInitScript("q_test_init.sql");
+        setInitScript("src_only.sql");
         setCleanupScript("q_test_cleanup.sql");

         setHiveConfDir("");
```


### Fix `org.datanucleus.exceptions.ClassNotPersistableException: The class "org.apache.hadoop.hive.metastore.model.MVersionTable"` issue

If you encounter issue while trying to run TestCliDriver from IntelliJ, update hive-it-qfile to have a Test scope dependency on the metastore JAR (in metastore/target, NOT the metastore module). Move it to the top of the Dependencies list.

Can do the same thing for the hive-exec (ql) module to fix the issue when running unit tests (example: TestTxnCommands2).

https://qnalist.com/questions/5105293/running-tests-in-intellij


### Fix build issues finding `gen.VectorXXX` classes

These classes exist in `ql/target/generated-sources`, so you need to build from the command line first before importing.