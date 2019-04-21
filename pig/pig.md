### Change tuple schema in bag

```
a = load 'temp' using PigStorage() as (value: {(A: int,B: int,C: int)});
describe a;

b = foreach a {
  new_value = foreach value generate A, B;
  generate new_value as value;
}

describe b;
```


### `exec` command

Exec without any parameters can be used in scripts to force execution up to the point in the script where the exec occurs.

https://pig.apache.org/docs/latest/cmds.html#exec


### Tuning Pig scripts

http://blog.cloudera.com/blog/2015/07/how-to-tune-mapreduce-parallelism-in-apache-pig-jobs/


### Append to directory

Not possibly natively in Pig, but you could write to another directory and then use a DFS command to move the files.

https://community.hortonworks.com/questions/2562/appending-to-existing-partition-with-pig.html


### Data Types

Does not support union types. Even if you use AvroStorage and write using an output schema containing a union, you can only write 1 type to that union, since internally, a field can only be say, an int, or a string, but not both.


### PigRunner vs. PigServer

Use PigRunner. Have experienced issues with PigServer in the past.

```
import org.apache.pig.PigRunner;

PigRunner.run(new String[] {
        "-x", "local",
        "/tmp/foo.pig"
    }, null);
```


### Disable direct HDFS fetch

```
set opt.fetch false;
```


### Ivy logging

```
-Divy.message.logger.level=4
```


### Disable optimizations

```
-- Disable just the ColumnMapKeyPrune optimization
set pig.optimizer.rules.disabled 'ColumnMapKeyPrune';

-- Disable all optimizations (not recommended)
set pig.optimizer.rules.disabled 'all';
```


### SIZE UDF

When used on bag, returns number of tuples in bag.

https://www.tutorialspoint.com/apache_pig/apache_pig_size.htm


### In operator

```
a = LOAD ‘1.txt’ USING PigStorage (‘,’) AS (i:int);

b = FILTER a BY i IN (1, 22, 333, 4444, 55555);
```
https://www.edureka.co/blog/operators-in-apache-pig-diagnostic-operators/


### COGROUP

Put things into groups by a key, for each field specify the group key. In below example, A's key is owner, B's key is friend2.

```
X = COGROUP A BY owner, B BY friend2;

DESCRIBE X;
X: {group: chararray,A: {owner: chararray,pet: chararray},B: {friend1: chararray,friend2: chararray}}

-- What X consists of:
(Alice,{(Alice,turtle),(Alice,goldfish),(Alice,cat)},{(Cindy,Alice),(Mark,Alice)})
(Bob,{(Bob,dog),(Bob,cat)},{(Paul,Bob)})
(Jane,{},{(Paul,Jane)})
```
http://pig.apache.org/docs/r0.15.0/basic.html#group


### Print dependencies

```
ant ivy-deps
# Generates a .html file with dependency graph
```


### Contribute patch

```
git diff --no-prefix <commit> > PIG-1234.1.patch

# Upload patch (More --> Attach Files)

rbt post --guess-fields yes
```

https://cwiki.apache.org/confluence/display/PIG/HowToContribute#HowToContribute-Contributingyourwork


### Pig 0.11 documentation

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


### Accessing Tuple fields in UDF

Must be by positional index, not name. If it were name, every Pig script would have to use the same names!

http://stackoverflow.com/questions/16993414/get-fields-by-name-in-pig


### Define alias for UDF

```
REGISTER piggybank.jar
DEFINE MAXNUM org.apache.pig.piggybank.evaluation.math.MAX;
```


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

-- To solve Jython
-- ImportError: No module named <module>
-- https://issues.apache.org/jira/browse/PIG-2433
pig -Dmapred.child.env="JYTHONPATH=job.jar/Lib" script.pig

### EXPLAIN a script to see the MR plan

```
# From the Pig grunt shell
explain -script <pig.script> -param <name>=<value> ...

# From command-line
pig -e "explain -script <pig.script> -param <name>=<value> ..." > output_file

pig -e "explain -script foo.pig" > temp
```

-- Set custom Pig classpath
PIG_CLASSPATH=/path/to/jars/* pig -x local

### Remove a file or directory

```
-- Don't use quotes around the file path.
RMF <file>;
```

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


### Flatten a bag

```
(a, {(b,c),(d,e)})
GENERATE $0, flatten($1) --> (a,b,c), (a,d,e)
```

https://pig.apache.org/docs/r0.11.1/basic.html#flatten


### FLATTEN and give alias

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


### Jars needed for testing

```
hadoop-mapreduce-client-common
```


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


### Decode Pig script from Hadoop job configuration

If pig.script is set, you can run:

```
# Mac
echo "BASE64_STRING" | base64 -D

# Linux
echo "BASE64_STRING" | base64 -d
```


### ILLUSTRATE

https://pig.apache.org/docs/r0.11.1/test.html#illustrate
```
words = load 'test.avro' using AvroStorage();
frequent_words = filter words by freq >= 10;
illustrate frequent_words;
```

Hacked BagTo2Tuple together based on BagToTuple.