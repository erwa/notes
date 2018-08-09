### Transactions

They work even if a metastore compactor thread is not set up, but delta files will just accumulate over time.

https://cwiki.apache.org/confluence/display/Hive/Hive+Transactions


### Merge small files

```
set hive.merge.mapredfiles=true;
```


### Set hive-site.xml location

HiveConf.setHiveSiteLocation(new URL("file:///path/to/hive-site.xml"));


### Unset TBLPROPERTIES

```
ALTER TABLE tableName UNSET TBLPROPERTIES IF EXISTS (key1, key2, ...);
```

Works on partition, too.

Not possible to unset SERDEPROPERTIES: https://issues.apache.org/jira/browse/HIVE-12414


### TBLPROPERTIES vs. SERDEPROPERTIES

If same property set in table properties and serde properties, the table property takes precedence.

Table.getTableMetadata -> MetaStoreUtils.getTableMetadata -> MetaStoreUtils.getSchema -> serde properties added first, then table properties overwrite


### Show TBLPROPERTIES

```
show tblproperties my_db.my_table;
```


### UDTF

Only a single expression is supported when used in `SELECT my_udtf(...)`. This is invalid: `SELECT my_udtf(...), another_field`.


### Write to file

```
-- FileSystem is default filesystem (probably HDFS)
INSERT OVERWRITE DIRECTORY '/path/to/output/dir' SELECT * FROM table WHERE id > 100;
```

https://stackoverflow.com/questions/14289846/hive-query-output-to-file


### Run script inside CLI

```
-- Supported by CliDriver but not Driver
SOURCE <filepath>;
```


### Create empty Table

```
// org.apache.hadoop.hive.ql.metadata.Table
  public Table(String databaseName, String tableName) {
    this(getEmptyTable(databaseName, tableName));
  }

Table t = new Table("db", "tbl");
```


### Size of array

```
size(array_field)
```


### Scan subdirectories

```
SET hive.mapred.supports.subdirectories=TRUE;
SET mapred.input.dir.recursive=TRUE;
```

https://stackoverflow.com/questions/26767713/can-hive-recursively-descend-into-subdirectories-without-partitions-or-editing-h


### Hadoop jars and other jars required to run embedded metastore

```
org.datanucleus:datanucleus-api-jdo
org.datanucleus:datanucleus-core
org.datanucleus:datanucleus-rdbms
org.apache.derby:derby
hadoop-common
hadoop-hdfs
hadoop-mapreduce-client-core
javax.jdo:jdo-api
```


### Mod operator / mod function

```
a % b
```


### Convert Avro Schema to TypeInfo

```
AvroObjectInspectorGenerator avroObjectInspectorGenerator = new AvroObjectInspectorGenerator(schema);
TypeInfo typeInfo = TypeInfoFactory.getStructTypeInfo(
  avroObjectInspectorGenerator.getColumnNames(),
  avroObjectInspectorGenerator.getColumnTypes());
```


### Convert `FieldSchema` to `TypeInfo`

```
TypeInfoUtils.getTypeInfoFromTypeString(fs.getType())
```


### Print tables in databases

```
!echo ===database1===;
show tables in database1;
!echo ===database2===;
show tables in database2;
```


### Show current database

```
set hive.cli.print.current.db = true;
```


### Security

SSL support for HMS added in 2.3.0: https://issues.apache.org/jira/browse/HIVE-15025


### Mailing Lists

https://hive.apache.org/mailing_lists.html


### SMB (sort-merge-bucket) join

`hive.enforce.bucketing` sorts data within each bucket.

https://cwiki.apache.org/confluence/display/Hive/LanguageManual+JoinOptimization#LanguageManualJoinOptimization-AutoConversiontoSMBMapJoin

https://stackoverflow.com/questions/6934327/using-sorted-tables-in-hive


### Equal not null operator

```
<=>
```

http://docs.qubole.com/en/latest/user-guide/features/smart-query/hive-smart-query.html


### JOIN column types

You can JOIN on complex types, too.


### Ignore CLI errors

Useful when running a Hive file with multiple statements.

```
set hive.cli.errors.ignore=true;
...
```


### BETWEEN

```
select * from foo where uid between 2 and 4;
```
http://cloudfront.blogspot.com/2012/07/between-operator-in-hive.html


### TABLESAMPLE

```
-- take the first 10 rows from each input split
SELECT * FROM my_table TABLESAMPLE(10 ROWS);
```
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+Sampling#LanguageManualSampling-BlockSampling


### Run CLI commands using Driver

```
HiveConf hiveConf = new HiveConf();
Driver driver = new Driver(hiveConf);
SessionState.start(hiveConf);
driver.init();
driver.run("show tables;");

# get results
List<String> results = new ArrayList<>();
driver.getResults(results);
```

May have to set `java.security.krb5.realm` and `java.security.krb5.kdc`.


### Insert Values

```
INSERT INTO t SELECT 1, create_union(0, "test1");
INSERT INTO t SELECT 1, "test2";

INSERT INTO TABLE tablename [PARTITION (partcol1[=val1], partcol2[=val2] ...)] VALUES values_row [, values_row ...]
```

Cannot insert complex types because it does not support literals for complex types (array, map, union, struct). For complex types, need to either load from file or load from another table (and use complex type constructors).

https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DML#LanguageManualDML-InsertingvaluesintotablesfromSQL


### Distribute By, Sort By, Cluster By

* Distribute By COL means all rows with the same value for COL will go to one reducer. Does not guarantee ordering.
* Sort By COL ensures rows are sorted by COL when fed to reducer. Guarantees PER REDUCER order. Order By guarantees total order.
* Cluster By is syntactic sugar for Distribute By AND Sort BY

https://cwiki.apache.org/confluence/display/Hive/LanguageManual+SortBy


### Hive on Spark

First available in Hive 1.1.0 (HIVE-7292). Developed on "spark" and "spark2" branches, periodically merged into "master".

https://cwiki.apache.org/confluence/display/Hive/Hive+on+Spark%3A+Getting+Started


### CBO (Cost-based Optimization)

Introduced in Hive 0.14.0 in HIVE-5775.

https://cwiki.apache.org/confluence/display/Hive/Cost-based+optimization+in+Hive


### LLAP

Live Long and Process. Added in Hive 2.0.0 (HIVE-7926).

https://cwiki.apache.org/confluence/display/Hive/LLAP


### Hive on Tez

First added in Hive 0.13 using Tez 0.4.0. Hive 0.14 through 1.1 use Tez 0.5.2. Hive 1.2 uses 0.5.3. Hive 2.0 uses 0.8.2.

https://cwiki.apache.org/confluence/display/Hive/Hive-Tez+Compatibility


### ORC

Originally added in Hive 0.11.0 in HIVE-3874.


### Variable substitution

```
-- SET command only seems to work in CliDriver, not Driver
SET jar=../lib/derby.jar;
ADD FILE ${hiveconf:jar};

-- For Driver, use
SessionState.get().getHiveVariables().put("outputLocation", outputDir);
-- Then reference variable in script using
${outputLocation}

-- Also, VariableSubstitution.getSubstitute only seems to look for "hivevar:" or no prefix
```

https://cwiki.apache.org/confluence/display/Hive/LanguageManual+VariableSubstitution


### System variables

```
LOAD DATA LOCAL INPATH "${system:user.home}/..." INTO TABLE foo;
```


### Set system property for CLI

```
hive --hiveconf sys.prop=foo ...
```


### Writing Hive UDF

http://blog.matthewrathbone.com/2013/08/10/guide-to-writing-hive-udfs.html


### Test configuration

Uses `data/conf/hive-site.xml`.


### Enable more Grape logging

```
hive --hiveconf groovy.grape.report.downloads=true ...
```


### Logging

Hive will use the hive-log4j.properties in the current working directory, if present.

```
log4j.logger.hive=WARN
log4j.logger.org.apache.hadoop.hive.=WARN
log4j.logger.SessionState=WARN
```


### Recover partitions

```
MSCK REPAIR TABLE table_name;
```
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-RecoverPartitions(MSCKREPAIRTABLE)


### Qtests

Initialized by data/scripts/q_test_init.sql


### HiveServer2

JDBC client -> Thrift client -> HiveServer2. No JDBC implementation in HiveServer2 itself. Just a client-side interface wrapping Thrift client.

Internally, JDBC uses Driver (same as used by Hive CLI) for executing queries.


### Beeline

```
# Run in embedded HiveServer2 mode
beeline -u jdbc:hive2://

# for more logging, add
--version

!q # quit, or Ctrl + D

# Help
!help

# Connect to embedded HiveServer2
!connect jdbc:hive2://
```



### Debugging.

See [debug.md](debug.md).

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

Hive PreCommit build: https://builds.apache.org/job/PreCommit-HIVE-Build/
Logs kept around for about 3 days.

In Hive 0.14, need to add Avro jar explicitly using "ADD JAR" command or else "insert" will fail with ClassNotFoundException

* Launch Hive with aux/lib jars (like Haivvreo):
hive --auxpath /export/apps/hive/latest/aux/lib

* Make sure you don't accidentally have a hive-site.xml file in the directory you launch hive from, or else it will be used instead of the one in $HIVE_HOME/conf

* If you're running locally using Derby, and you're trying to set up local Jenkins Hive tests, you may get
* permissions issues because the db.lck file is read-only and owned by one user.
* The easiest solution is to just
```
chmod -R 777 <hive_metastore_db_dir>
```


### One split per file

```
set hive.input.format = org.apache.hadoop.hive.ql.io.HiveInputFormat;
set mapreduce.input.fileinputformat.split.minsize = 999999999999;
```


### Splits across partitions

One map task gets one CombineHiveInputSplit, which may contain splits from more than one partition. However, all the partitions will have the same InputFormat.


### Split sizes

```
# mapred.min.split.size.per.node (the minimum bytes of data to create a node-local partition, otherwise the data will combine to rack level. default:0)
# mapred.min.split.size.per.rack (the minimum bytes of data to create a rack-local partition, otherwise the data will combine to global level. default:0)
# mapred.max.split.size (the max size of each split, will be exceeded because we stop accumulating *after* reaching it, instead of before)
# https://issues.apache.org/jira/browse/HIVE-74
```


### Rename column

```
ALTER TABLE table_name CHANGE col_old_name col_new_name col_type;
```
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-ChangeColumnName/Type/Position/Comment



### Drop partitions greater than a time

```
-- Also deletes the data.
alter table foo drop partition (partitionfield > '2014-10-30-00')
```

To drop a partition without deleting the underlying data:
* Change the location of the partition to point to a directory you don't mind deleting.
* Drop the partition.

## Views

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


### Describe functions

```
DESC FUNCTION myUdf;
DESC FUNCTION EXTENDED myUdf;
```

https://cwiki.apache.org/confluence/display/Hive/LanguageManual+UDF


### Show functions

```
-- Only seems to show built-in functions, not permanent functions
SHOW FUNCTIONS "a.*";
```
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-ShowFunctions


### Permanent Functions

* Create permanent function: http://stackoverflow.com/questions/20043448/how-to-add-a-permanent-function-in-hive
```
CREATE FUNCTION [db_name].function_name AS class_name [USING JAR|FILE|ARCHIVE 'file_uri' [, JAR|FILE|ARCHIVE 'file_uri'] ]

CREATE FUNCTION getContentValue AS 'com.my.udf.GetContentValue' USING JAR '/home/taobao/oplog/hivescript/my_udf.jar';
```


### Temporary tables

https://community.hortonworks.com/articles/9337/hive-temporary-tables.html

* do not support partitioned tables
* can register a temporary view using the Java API


### Temporary functions

```
CREATE TEMPORARY FUNCTION foo AS com.example.Foo;
```
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-Create/Drop/ReloadFunction


###  Show databases matching expression

```
show databases like 'a*';
```


### Adding a jar

```
add jar hdfs:/user/ahsu/foo.jar;
add jar hdfs:///user/ahsu/foo.jar;
add jar hdfs://NAMENODE_HOST:PORT/user/ahsu/foo.jar;
```

https://cwiki.apache.org/confluence/display/Hive/LanguageManual+Cli#LanguageManualCli-HiveResources


### Describe table with more details

```
desc formatted TABLE;
desc extended TABLE;
```


### Creating an Avro Table

```
create external table u_ahsu.map_table
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
location 'hdfs:///user/ahsu/map_table'
TBLPROPERTIES ('avro.schema.literal'='{"namespace":"test","name":"avrostruct","type":"record","fields":[
{"name":"map_field","type": {"type": "map", "values": "string" } }
] }');

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


### Alter partition SerDe properties

```
alter table foo partition(part_col='testpartition') set serde 'org.apache.hadoop.hive.serde2.avro.AvroSerDe';
```


### Drop table if exists

```
drop table if exists TABLE;
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


### Insert into partitioned table

```
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

insert into my_table partition(part_col) select * from other_table where part_col='foobar' limit 5;
```


### Create partitioned table

```
CREATE TABLE my_table (a int) PARTITIONED BY (b string);
```


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


### Casting to complex type

Does not seems supported in Hive. Grep code base for "CAST" and you won't see any examples CASTing to complex types. Related upstream ticket: https://issues.apache.org/jira/browse/HIVE-658

Workaround:

```
-- create NULL struct field
if (false, named_struct('foo', true, 'bar', ''), NULL) AS struct_field
```


### Getting two hours ago in different time zone in specific format

Assuming you cannot change the TZ environment variable:
```
select concat(
  substring(from_utc_timestamp(from_unixtime(unix_timestamp() - 7200), 'America/Los_Angeles'), 0, 10),
  concat(
    '-',
    substring(from_utc_timestamp(from_unixtime(unix_timestamp() - 7200), 'America/Los_Angeles'), 12, 2)
  )
)
from u_ahsu.test_text;
```


### Insert single constant row

```
CREATE TABLE test_table (array_field ARRAY<STRING>);
INSERT INTO test_table SELECT ARRAY('aaa', 'bbb');
```


### Describe single column

```
desc TABLE.COLUMN;
```


### Access map field

```
select map_field['key_name'] ...
```


### Python UDF

http://spryinc.com/blog/guide-user-defined-functions-apache-hive

```
add FILE testUdf.py;

SELECT
TRANSFORM (hosting_ids, user_id, d)
USING 'testUdf.py' AS (hosting_ranks_array, user_id, d)
FROM
s_table;
```


### Optimization settings

https://cwiki.apache.org/confluence/display/Hive/Configuration+Properties#ConfigurationProperties-QueryandDDLExecution

```
-- Disable fetch task
set hive.fetch.task.conversion=none;

-- Convert more stuff to a fetch task (no MR job launched)
set hive.fetch.task.conversion=more;
```


### ALTER VIEW

```
-- You cannot modify both TBLPROPERTIES and the view definition
-- in the same ALTER VIEW statement. You have to execute them
-- separately. You can only specify both at the same time
-- during CREATE VIEW.

ALTER VIEW view_name SET TBLPROPERTIES table_properties;

ALTER VIEW view_name AS select_statement;
```

https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL


### Reduce amount of logging

```
hive --hiveconf hive.root.logger=OFF --hiveconf hive.session.silent=true -f test.hql
```

### Enums

Hive has no concept of enums.
* https://cwiki.apache.org/confluence/display/Hive/LanguageManual+Types
* https://cwiki.apache.org/confluence/display/Hive/AvroSerDe

### Characters to escape

Need to escape semicolons using `\;`.


### Hive Hooks

Driver hooks, called in this order: HiveDriverRunHook -> HiveSemanticAnalyzerHook -> PreExecute

http://stackoverflow.com/questions/17461932/hive-execution-hook


### Set output file extension

```
set hive.output.file.extension=.foo;
```


### Contributing

```
git diff --no-prefix <commit>^ > HIVE-1234.1.patch

# Upload patch (More --> Attach Files)
# Click "Submit Patch"
# Unit tests will automatically run, usually within 24 hours

# When updating patch, click "Submit Patch" again.

# Post an RB
rbt post --guess-fields yes
```

https://cwiki.apache.org/confluence/display/Hive/HowToContribute#HowToContribute-CreatingaPatch


### Retest patch

Cancel and resubmit patch.

https://cwiki.apache.org/confluence/display/Hive/HowToContribute#HowToContribute-PrecommitTestsbyHiveQA


### Generating Thrift

https://cwiki.apache.org/confluence/display/Hive/HowToContribute#HowToContribute-GeneratingThriftCode

Use Java 7 when building Thrift.