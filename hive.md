
# Hive Eclipse Setup

### Hive 0.13 and newer

### Building Mavenized Hive as distribution
Use Java 7+.
```
mvn clean package -DskipTests -Phadoop-2 -Pdist
```

Distribution appears in `packaging/target`.

### Running Hive itests
Start from the Hive root dir.
```
mvn clean install -DskipTests -Phadoop-2
cd itests
mvn clean install -DskipTests -Phadoop-2
```

In case of memory issues, run
```
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
```

Tests in the `itests` directory need to be run from the `itests` directory:
```
# Make sure you do a build first! (see above)
# For tests in the itests directory:
cd itests

# Run a single test
# Add -Dtest.output.overwrite=true to overwrite expected output files
mvn test -Phadoop-2 -Dtest=TestCliDriver -Dqfile=avro_partitioned.q [-Dtest.output.overwrite=true]

# Run single method of test class
mvn test -Phadoop-2 -Dtest=TestRemoteHiveMetaStore#testAlterViewParititon

# Run tests matching a regex
mvn test -Phadoop-2 -Dtest=TestCliDriver -Dqfile_regex=.*avro.*
```

#### HiveMetaStore Tests
TestHiveMetaStore.java is excluded because you should run TestEmbeddedHiveMetaStore.java and TestRemoteHiveMetaStore.java instead.
```
mvn test -Phadoop-2 -Dtest=TestRemoteHiveMetaStore
mvn test -Phadoop-2 -Dtest=TestEmbeddedHiveMetaStore
```

#### Run Hive unit test not in itests directory
```
# Run from root directory.
mvn test -Phadoop-2 -Dtest=TestAvroSerdeUtils
```

See https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-HowdoIimportintoeclipse?.
```
mkdir workspace
cd workspace
git clone https://github.com/apache/hive.git
cd hive
mvn clean install -DskipTests -Phadoop-2
mvn eclipse:clean
mvn eclipse:eclipse -DdownloadSources -DdownloadJavadocs -Phadoop-2
cd itests
mvn clean install -DskipTests -Phadoop-2
mvn eclipse:clean
mvn eclipse:eclipse -DdownloadSources -DdownloadJavadocs -Phadoop-2
```

When importing into Eclipse, use Import, NOT New -> Java Project. Make sure to enable project specific save settings and disable save actions.

### Hive Eclipse arguments

#### Hive trunk Eclipse maven configuration

CliDriver Classpath:
- /home/ahsu/github/erwa/hive/hive/conf
- /export/apps/hadoop/latest/conf
- hive-metastore-0.14.0-SNAPSHOT.jar
- hadoop-{core,test,tools}-1.2.1.jar
- hive-cli (default classpath)

Program arguments:
* Initially none
* I added:
```
--hiveconf javax.jdo.option.ConnectionURL=jdbc:derby:;databaseName=/home/ahsu/metastore_db;create=true
```
* VM arguments:
```
# initially
-Xms256m -Xmx1024m -XX:-UseSplitVerifier -Dhive.root.logger=INFO,console -Dhadoop.bin.path=/home/ahsu/gitli/ahsu-hive/testutils/hadoop

# After my changes:
-Xms256m -Xmx1024m -XX:-UseSplitVerifier -Dhive.root.logger=INFO,console -Dhadoop.bin.path=/export/apps/hadoop/latest/bin/hadoop
```

Initially, you might have to build twice for errors to go away.
* Try clean after first build before building again
* `commons-codec` .classpath library reference needs to be updated to newer version (also in the source tree), which has a new class StringUtils
* Added /export/apps/hadoop/latest/conf to my HiveCLI run config classpath
* Added /export/apps/hadoop/latest/hadoop-{core,test,tools}-1.2.1.jar to classpath
* Added commons-configuration

To debug Hive and print more info:
```
hive -hiveconf hive.root.logger=INFO,console
```

To use a different Hive config
```
export HIVE_HOME=/export/home/ahsu/hive-0.12.0.li.new

# only supports local filesystem
export HIVE_AUX_JARS_PATH=$HIVE_HOME/aux/lib

export PATH=$HIVE_HOME/bin:$PATH
hive
# run your query
```

### Debug Hive unit test from Eclipse
You may need to create a `hive-site.xml` somewhere with the custom properties you need and then add the containing folder to your debug classpath. If you need to attach source, you can add a Variable for your Git repository, and add an extension to the folder that contains the classes. When making changes, you may need to rebuild the project (sometimes from Eclipse and sometimes from the command line) for changes to take effect.

### Ant ###

### Hive 0.12 and older
See https://cwiki.apache.org/confluence/display/Hive/GettingStarted+EclipseSetup. Make sure you're using JDK 1.6.
```
# Takes about 4 minutes.
ant clean package eclipse-files
```
Importing existing project into Eclipse. Ensure Java Compiler is in 1.6 compliance mode. Fix the following libraries in the Java Build Path:
* hadoop-core-1.2.1.jar
* hadoop-test-1.2.1.jar
* hadoop-tools-1.2.1.jar
The jars are in `build/ivy/lib/hadoop0.20S.shim`. Replace the `commons-codec-1.3.jar` with `commons-codec-1.4.jar` (in `build/ivy/lib/hadoop0.20S.shim`).

Then build the project in Eclipse. It will launch an ant delegate as part of the build. The build should take about 90 seconds.

#### Building Hive 0.12.0 and earlier versions
```
ant clean package
```

In case of memory issues, run
```
export ANT_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
```

# running Hive tests
ant clean package test -Dtestcase=TestCliDriver -Dqfile=avro_partitioned.q [-Doverwrite=true]
ant test -Dtestcase=TestCliDriver -Dqfile=avro_partitioned.q [-Doverwrite=true]
ant test -Dtestcase=TestCliDriver -Dqfile_regex=.*partition.*

# build tarball in ant
ant clean binary

### Ant ###

# ant, Hive 0.12.0 and earlier
# building Hive
ant clean package

# running Hive tests
ant clean package test -Dtestcase=TestCliDriver -Dqfile=avro_partitioned.q [-Doverwrite=true]
ant test -Dtestcase=TestCliDriver -Dqfile=avro_partitioned.q [-Doverwrite=true]
ant test -Dtestcase=TestCliDriver -Dqfile_regex=.*partition.*

# build tarball in ant
ant clean binary

# Hive print column names
set hive.cli.print.header=true;

# hive show permissions/roles/grants for user
show grant user ahsu on database u_ahsu;
show role grant user ahsu;

# Hive example join
select * from test2 a join test3 b where a.id = b.k;

# load local data into Hive table
# path specified is a directory
load data local inpath '/export/home/ahsu/test2' into table test2;

### create Hive table
```
-- create text Hive table
create table test (a string) row format delimited fields terminated by ',' stored as textfile;
```

Hive PreCommit build: http://ec2-174-129-184-35.compute-1.amazonaws.com/jenkins/job/PreCommit-HIVE-Build/

# In Hive 0.14, need to add Avro jar explicitly using "ADD JAR" command or else "insert" will fail with ClassNotFoundException

# Launch Hive with aux/lib jars (like Haivvreo):
hive --auxpath /export/apps/hive/latest/aux/lib

# You can change log level and output location in conf/hive-log4j.properties
hive.root.logger=DEBUG,DRFA,console

# Make sure you don't accidentally have a hive-site.xml file in the directory you launch hive from, or else it will be used instead of the one in $HIVE_HOME/conf

# If you're running locally using Derby, and you're trying to set up local Jenkins Hive tests, you may get
# permissions issues because the db.lck file is read-only and owned by one user.
# The easiest solution is to just
chmod -R 777 <hive_metastore_db_dir>

# Explanation of
# mapred.min.split.size.per.node (the minimum bytes of data to create a node-local partition, otherwise the data will combine to rack level. default:0)
# mapred.min.split.size.per.rack (the minimum bytes of data to create a rack-local partition, otherwise the data will combine to global level. default:0)
# mapred.max.split.size (the max size of each split, will be exceeded because we stop accumulating *after* reaching it, instead of before)
# https://issues.apache.org/jira/browse/HIVE-74

# Disable map joins (which require launching a local task,
# which might have memory issues)
set hive.auto.convert.join = false;

# Enable session history
hive -hiveconf hive.session.history.enabled=true
# Default is false.
# If true, this will cause a log to be created in `hive.querylog.location`

# Drop partitions greater than a time
alter table foo drop partition (partitionfield > '2014-10-30-00')

# Views

### Create view
```
create view testview as select a from test;
```

### Delete view
```
drop view testview;
```

### Show view definition
```
describe formatted DATABASE.VIEWNAME;
```

# Hive 0.13 added permanent functions, which can be registered to a
# particular database

### Show functions
```
SHOW FUNCTIONS "a.*";
```
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-ShowFunctions


# Show databases matching expression
show databases like 'a*';

# Adding a jar
# https://cwiki.apache.org/confluence/display/Hive/LanguageManual+Cli#LanguageManualCli-HiveResources
add jar hdfs:/user/ahsu/foo.jar;
add jar hdfs:///user/ahsu/foo.jar;
add jar hdfs://NAMENODE_HOST:PORT/user/ahsu/foo.jar;

Describe table with more details
```
desc formatted TABLE;
desc extended TABLE;
```

### Creating an Avro Table
```
CREATE [EXTERNAL] TABLE table_name
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
WITH SERDEPROPERTIES ('avro.schema.url'='SCHEME:///PATH/TO/SCHEMA')
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
[LOCATION '/PATH/TO/TABLE'];

-- You can also use 'avro.schema.literal' instead of 'avro.schema.url'.
```

### Add partition
```
ALTER TABLE table_name ADD [IF NOT EXISTS]
PARTITION (partition_column = partition_col_value)
[LOCATION 'location1']
```

### Cannot drop external table
```
hive > drop table foo;
FAILED: Execution Error, return code 1 from org.apache.hadoop.hive.ql.exec.DDLTask. MetaException(message:Table metadata not deleted since hdfs://HOST:PORT/path/to/foo is not writable by USER)

hive > alter table foo set location 'hdfs:///path/to/dir/in/writable/dir';

hive > drop table foo;
```

### Setting properties in Hive script
```
set PROP = VALUE;
```
Gotcha: Don't forget the equal sign!

### Showing DDL used to create a table/view
```
show create table TABLE
```

### Add file/jar to DistributedCache for UDF
* getRequiredFiles()
* getRequiredJars

initialize() is called before these methods, so you can pass arguments to the initialize() method, store them, and then use them in the getRequiredFiles() and getRequiredJars() methods. See GenericUDF.initializeAndFoldConstants().

### Comments don't work in Hive shell
Don't use `--` in Hive shell. Watch out when copying and pasting scripts!