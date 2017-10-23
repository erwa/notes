pig-0.15.0-build.md

```
# jar only (takes about 1 min on Mac)
ant clean jar -Dhadoopversion=23  -Dhadoop-common.version=2.6.1 -Dhadoop-hdfs.version=2.6.1 -Dhadoop-mapreduce.version=2.6.1 -Dforrest.home=$FORREST_HOME

# Takes about 2.5 minutes on Mac
ant clean tar -Dhadoopversion=23  -Dhadoop-common.version=2.6.1 -Dhadoop-hdfs.version=2.6.1 -Dhadoop-mapreduce.version=2.6.1 -Dforrest.home=$FORREST_HOME

# Run precommit tests (20 minutes)
ant -Djavac.args="-Xlint -Xmaxwarns 1000" clean test-commit -Dhadoopversion=23

# Add -Dtest.junit.output.format=xml to output in XML

git diff --no-prefix > PIG-4547.1.patch
```

### Submit RB (Review Board)
* Go to https://reviews.apache.org/
* New Review Request
* Select "pig-git" as the repository
* Upload patch generated above.
* Fill in fields.


### Testing
```
Test logs in build/test/logs
```