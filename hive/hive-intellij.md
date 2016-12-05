### Fix `org.datanucleus.exceptions.ClassNotPersistableException: The class "org.apache.hadoop.hive.metastore.model.MVersionTable"` issue

If you encounter issue while trying to run TestCliDriver from IntelliJ, update hive-it-qfile to have a Test scope dependency on the metastore JAR (in metastore/target, NOT the metastore module).

Can do the same thing for the hive-exec (ql) module to fix the issue when running unit tests (example: TestTxnCommands2).

https://qnalist.com/questions/5105293/running-tests-in-intellij


### Fix build issues finding `gen.VectorXXX` classes

These classes exist in `ql/target/generated-sources`, so you need to build from the command line first before importing.