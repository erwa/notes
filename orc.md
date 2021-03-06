### Is ORC file?

https://github.com/alibaba/DataX/blob/master/hdfsreader/src/main/java/com/alibaba/datax/plugin/reader/hdfsreader/DFSUtil.java#L571

`isORCFile()` method


### Get Hive Schema

`Reader.getObjectInspector().getTypeName()`

Example: https://github.com/azkaban/azkaban-plugins/blob/4388c15a1435c1b0edb17dc5a61c234351019cd1/plugins/hdfsviewer/src/azkaban/viewer/hdfs/ORCFileViewer.java#L143

DON'T use `Reader.getSchema()` (this returns an ORC TypeDescription)


### ORC CLI Tool

Download orc-tools-X.Y.Z-uber.jar: http://search.maven.org/#search%7Cga%7C1%7Corc-tools

```
java -jar ~/lib/orc-tools-1.5.0-uber.jar --help

# to pick up Hadoop conf
java -cp ./lib/*:`hadoop classpath` org.apache.orc.tools.Driver --help
```


### Building source

Java client takes about 3 minutes to build.


### Overview

Rows partitioned into stripes (like a row group). Within each stripe, each column encoding first, then compressed using codec like Zlib.

Has index and max/min per 10000 rows, with pointers to offsets in each column (positions per stream), allowing quickly skipping over a set of rows.

https://code.facebook.com/posts/229861827208629/scaling-the-facebook-data-warehouse-to-300-pb/

Stride is the number of rows between each index entry in a stripe.
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+ORC#LanguageManualORC-HiveQLSyntax


### References

https://code.facebook.com/posts/229861827208629/scaling-the-facebook-data-warehouse-to-300-pb/


### Dictionary encoding.

Used for string columns. Can cause bloat when column entropy is high.

https://code.facebook.com/posts/229861827208629/scaling-the-facebook-data-warehouse-to-300-pb/


### Stripes

Generally 256 MB


### Dump ORC file contents

```
# No `-d` in Hive 0.13.1
hive --service orcfiledump -d path/to/file
```