-- Pig 0.11 documentation
-- http://pig.apache.org/docs/r0.11.1/

-- count # of rows in an alias
-- http://stackoverflow.com/questions/9900761/pig-how-to-count-a-number-of-rows-in-alias
LOGS= LOAD 'log';
LOGS_GROUP= GROUP LOGS ALL; -- groups all records into single group
LOG_COUNT = FOREACH LOGS_GROUP GENERATE COUNT(LOGS);

-- Combine Small Input Files
-- http://pig.apache.org/docs/r0.11.1/perf.html#combine-files
set pig.maxCombinedSplitSize <size_in_bytes>

-- Add file to distributed cache for use in UDF
-- http://ragrawal.wordpress.com/2014/03/25/apache-pig-and-distributed-cache/
--set mapred.cache.files /user/ahsu/test2#test2;
register 'test.py' using jython as myfuncs;
a = load 'test';
b = foreach a generate myfuncs.helloworld();
dump b;

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

-- Set default time zone for Pig's built-in date functions
-- NOTE: This does not affect the default environment time zone (e.g.: for the `date` command)
set pig.datetime.default.tz America/Los_Angeles;

-- One instance of UDF per map or reduce task, so you can share state within that context
-- http://chimera.labs.oreilly.com/books/1234000001811/ch10.html#where_udfs_run