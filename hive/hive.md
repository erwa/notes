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

Hive PreCommit build: http://ec2-174-129-184-35.compute-1.amazonaws.com/jenkins/job/PreCommit-HIVE-Build/

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

### Split sizes
```
# mapred.min.split.size.per.node (the minimum bytes of data to create a node-local partition, otherwise the data will combine to rack level. default:0)
# mapred.min.split.size.per.rack (the minimum bytes of data to create a rack-local partition, otherwise the data will combine to global level. default:0)
# mapred.max.split.size (the max size of each split, will be exceeded because we stop accumulating *after* reaching it, instead of before)
# https://issues.apache.org/jira/browse/HIVE-74
```

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

### Temporary functions
```
CREATE TEMPORARY FUNCTION foo AS com.example.Foo;
```
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-Create/Drop/ReloadFunction


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

### Describe single column
```
desc TABLE.COLUMN;
```

### Access map field
```
select map_field['key_name'] ...
```

### Python UDF
* http://spryinc.com/blog/guide-user-defined-functions-apache-hive
```
add FILE testUdf.py;

SELECT
TRANSFORM (hosting_ids, user_id, d)
USING 'testUdf.py' AS (hosting_ranks_array, user_id, d)
FROM
s_table;
```

### Optimization settings
* https://cwiki.apache.org/confluence/display/Hive/Configuration+Properties#ConfigurationProperties-QueryandDDLExecution
```
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
http://stackoverflow.com/questions/17461932/hive-execution-hook


### Set output file extension
```
set hive.output.file.extension=.foo;
```


### Contributing
```
git diff --no-prefix <commit> > HIVE-1234.1.patch

# Upload patch
# Click "Submit Patch"
# Unit tests will automatically run, usually within 24 hours

# Post an RB
rbt post --guess-fields yes
```
https://cwiki.apache.org/confluence/display/Hive/HowToContribute#HowToContribute-CreatingaPatch