-- Pig 0.11 documentation
-- http://pig.apache.org/docs/r0.11.1/

-- count # of rows in an alias
-- http://stackoverflow.com/questions/9900761/pig-how-to-count-a-number-of-rows-in-alias
LOGS= LOAD 'log';
LOGS_GROUP= GROUP LOGS ALL; -- groups all records into single group
LOG_COUNT = FOREACH LOGS_GROUP GENERATE COUNT(LOGS);

### Combine Small Input Files
* http://pig.apache.org/docs/r0.11.1/perf.html#combine-files

```
set pig.maxCombinedSplitSize <size_in_bytes>
```

Make sure `pig.noSplitCombination` is NOT set to `true`.

### Add file to distributed cache for use in UDF
http://ragrawal.wordpress.com/2014/03/25/apache-pig-and-distributed-cache/
```
-- no need to turn symlinking on in Hadoop 2, as it is always on in Hadoop 2
-- http://hadoop.apache.org/docs/r2.4.1/hadoop-project-dist/hadoop-common/DeprecatedProperties.html
set mapreduce.job.cache.files hdfs:///user/ahsu/foo1,hdfs:///user/ahsu/test2#foo2;
register 'test.py' using jython as myfuncs;
a = load 'test';
b = foreach a generate myfuncs.helloworld();
dump b;
```

-- REGISTER causes Pig to include the files in the jar you specified
-- in the job jar sent to Hadoop

# test.py
@outputSchema("word:chararray")
def helloworld():
    f = open('test2')
    return f.read()

-- can also launch job using
pig test.pig -Dmapred.cache.files=/user/ahsu/test#temp

mapred.cache.files=<hdfs_path>#<local_symlink_name>

-- UDFs are case-sensitive

-- Combine small input files
-- http://pig.apache.org/docs/r0.11.1/perf.html#combine-files
set pig.maxCombinedSplitSize <sizeInBytes>;

-- To solve Jython
-- ImportError: No module named <module>
-- https://issues.apache.org/jira/browse/PIG-2433
pig -Dmapred.child.env="JYTHONPATH=job.jar/Lib" script.pig

-- EXPLAIN a script to see the MR plan
-- Start the Pig grunt shell
explain -script <pig.script> -param <name>=<value> ...
-- Or
pig -e "explain -script <pig.script> -param <name>=<value> ..." > output_file

-- Set custom Pig classpath
PIG_CLASSPATH=/path/to/jars/* pig -x local

-- Remove a file or directory
RMF <file>

-- Building Pig 0.11.1 tarball distribution
ant clean src-release tar-release -Dhadoopversion=20  -Dhadoop-core.version=1.2.1 -Dhadoop-test.version=1.2.1 -Dforrest.home=$FORREST_HOME

-- Change logging level
pig -d DEBUG

-- java.lang.NoSuchMethodError: org.joda.time.DateTime.compareTo(Lorg/joda/time/ReadableInstant;)I
-- https://issues.apache.org/jira/browse/PIG-3953
-- Workaround:
PIG_CLASSPATH=/path/to/pig/lib/* pig

/* multi-
line
comments */

### Run shell command
See http://pig.apache.org/docs/r0.9.1/cmds.html#sh for details.
```
sh date

-- Use this for built-in shell commands.
sh bash -c "date \-\-date=\"1 day ago\""
```

### Setting timezone in Pig
```
-- Set default time zone for Pig's built-in date functions
-- NOTE: This does not affect the default environment time zone (e.g.: for the `date` command)
set pig.datetime.default.tz America/Los_Angeles;
```

Override environment timezone:
```
-- Option 1
%declare todaysDate `env TZ=America/Los_Angeles date +%Y-%m-%d.%H-%M`

-- Option 2
%declare ONE_DAY_AGO `bash -c "TZ=America/Los_Angeles date --date=\"1 day ago\" +%Y%m%d"`

-- Two hours ago
%declare TWO_HOURS_AGO env TZ=America/Los_Angeles date "+%Y-%m-%d-%H" -d "2 hours ago"
```

-- One instance of UDF per map or reduce task, so you can share state within that context
-- http://chimera.labs.oreilly.com/books/1234000001811/ch10.html#where_udfs_run

-- Order of JOIN operands matters. The large relation should come first.
-- https://pig.apache.org/docs/r0.11.1/perf.html#replicated-joins

-- Avro arrays get converted to bags
-- See AvroSchema2Pig.java, search for "convert array to a pig bag"

-- IllegalArgumentException about an empty string path may indicate a typo in the classpath or Pig additional jars
-- http://mail-archives.apache.org/mod_mbox/pig-user/201211.mbox/%3CCAG5+gXGj7SvoY4tx-h281xFhn9eK0MgQdRN-ST00XV7pJg9axw@mail.gmail.com%3E
-- IllegalArgumentException: Can not create a Path from an empty string
-- if pig.additional.jars=*, if * includes any non-jar files, you could see this exception as well

-- Reserved Keywords
-- https://pig.apache.org/docs/r0.11.1/basic.html#reserved-keywords
-- OUTPUT is a reserved keyword in Pig
-- If you use it as the name of an alias, you may get parsing errors

-- Accessing array of records
array_of_records.(record_field_1, record_field_2) --> bag of tuples(record_field_1, record_field_2)

### FLATTEN
https://pig.apache.org/docs/r0.11.1/basic.html#flatten

#### Flatten a bag
```
(a, {(b,c),(d,e)})
GENERATE $0, flatten($1) --> (a,b,c), (a,d,e)
```

#### FLATTEN and give alias
```
FLATTEN(foo) as (a,b,c);
```

### Eclipse Setup
See https://cwiki.apache.org/confluence/display/PIG/How+to+set+up+Eclipse+environment.

Make sure you're using JDK 1.7.

1. `ant clean eclipse-files -Dhadoopversion=23`
2. `ant compile gen -Dhadoopversion=23`
3. In Eclipse, File -> Import -> Existing Projects into Workspace -> Browse to Pig repo -> Finish.
4. Project -> Properties -> Java Build Path -> Source -> Add Folder `test/perf/pigmix/src/java`.
5. Project -> Properties -> Java Build Path -> Libraries -> Remove `javacc-4.2.jar`.
6. Project -> Properties -> Java Build Path -> Libraries -> Add JAR `test/perf/pigmix/lib/sdsuLibJKD12.jar`.
7. Project -> Properties -> Java Build Path -> Libraries -> Add External JAR hadoop-yarn-server-applicationhistoryservice-*.jar (You may need to find and download this jar yourself. It is needed for running tests.).
8. Project -> Properties -> Java Editor -> Save Actions -> Check "Enable project specific settings" -> Uncheck "Perform the selected actions on save" (This is to prevent reformatting of the code on save.).

You should now be able to build the project and run the tests using JUnit from within Eclipse.

### Contributing
See https://cwiki.apache.org/confluence/display/PIG/HowToContribute.
```
git diff --no-prefix
```

### Pig Input Format
Pig seems to always set `mapreduce.job.inputformat.class` to `org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigInputFormat`.

### Testing
https://cwiki.apache.org/confluence/display/PIG/HowToTest

Run single test:
```
ant -Dtestcase=TestRegisteredJarVisibility clean test
```

### Dereferencing NULL in Pig
* Dereferencing NULL returns NULL in Pig (according to a user)

### IMPORT statement
IMPORT will search in jars, too.