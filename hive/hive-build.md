### Runtime jars

Needed at runtime for running an embedded metastore:

```
# Hive 1.1
jdo-api-3.0.1.jar
datanucleus-api-jdo-3.2.6.jar
datanucleus-core-3.2.10.jar
datanucleus-rdbms-3.2.9.jar
derby-10.11.1.1.jar
```


### Build one module

```
# build just ql (hive-exec) module and all the modules it depends on
mvn package -pl ql -am -DskipTests -Dmaven.javadoc.skip=true
```


### Build for itests

Add `clean` to be safe.

```
# build for itests
mvn install -DskipTests -Dmaven.javadoc.skip=true -Pitests
```


### Generating tarball

Works for trunk

```
# Add "clean" to be safe or if you encounter build issues.

# Takes about 5 minutes
# build tarball
mvn install -DskipTests -Dmaven.javadoc.skip=true -Pdist

# Output in packaging/target directory

# build without itests
mvn package -DskipTests -Dmaven.javadoc.skip=true
```

https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-Howtogeneratetarball?


### Testing

```
# Run all tests
# https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-HowdoIrunalloftheunittests?
mvn test -Pitests

# You can also run tests for just one component by cd'ing to that component directory first
cd metastore
mvn test

# Run a single test
# https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-HowdoIrunasingletest?
mvn test -Dtest=ClassName

# Run 1 method in 1 unit test class
mvn test -Phadoop-2 -Dtest=org.apache.hadoop.hive.serde2.avro.TestAvroSerdeUtils#determineSchemaCanReadSchemaFromHDFS

##############

### qtests ###

##############

# Run qtests from itests/qtest
# if you want to build incremental changes before running, run from root directory
# but add -Pitests

### single qtest ###

# CliDriver
mvn test -Dtest=TestCliDriver -Dqfile=truncate_column_list_bucket.q

# MiniTezCliDriver
mvn test -Dtest=TestMiniTezCliDriver -Dqfile=explainuser_3.q

# LLAP tests (both MiniLlapLocalCliDriver and MiniLlapCliDriver) hang on Mac (https://issues.apache.org/jira/browse/HIVE-15467)
mvn test -Dtest=TestMiniLlapLocalCliDriver -Dqfile=auto_sortmerge_join_13.q
mvn test -Dtest=TestMiniLlapCliDriver -Dqfile=mapreduce2.q

# ovewrite output
mvn test -Dtest=TestCliDriver -Dqfile=orc_ppd_same_table_multiple_aliases.q -Dtest.output.overwrite=true

# custom init script
mvn test -Dtest=TestCliDriver -Dqfile=orc_ppd_same_table_multiple_aliases.q -DinitScript=test.sql

mvn test -Dtest=TestCliDriver -Dqfile=orc_ppd_same_table_multiple_aliases.q -DinitScript=src_only.sql
```


### ANTLR

```
# from ql directory
mvn antlr3:antlr
```


### Thrift

```
brew install thrift
```

Alternatively, build from source:

Download from http://thrift.apache.org/
```
cd /path/to/thrift-0.9.3
./configure --without-csharp --without-ruby

# build with Java 7
make
sudo make install

cd /path/to/hive
mvn clean install -Pthriftif -DskipTests -Dthrift.home=/usr/local
```

https://cwiki.apache.org/confluence/display/Hive/HowToContribute#HowToContribute-GeneratingThriftCode
