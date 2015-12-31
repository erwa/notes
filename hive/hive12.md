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

### Building Hive 0.12.0 and earlier versions
```
ant clean package

# build tarball
ant clean binary

# In case of memory issues, run
export ANT_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
```

### Running Hive tests
```
ant clean package test -Dtestcase=TestCliDriver -Dqfile=avro_partitioned.q [-Doverwrite=true]
ant test -Dtestcase=TestCliDriver -Dqfile=avro_partitioned.q [-Doverwrite=true]
ant test -Dtestcase=TestCliDriver -Dqfile_regex=.*partition.*
```