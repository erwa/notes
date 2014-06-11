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