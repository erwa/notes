### Change logging level
To debug Hive and print more info:
```
hive -hiveconf hive.root.logger=INFO,console
```

You can also change log level and output location in `conf/hive-log4j.properties`
```
hive.root.logger=DEBUG,DRFA,console
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

### Debug query in Eclipse
https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-HowdoIdebugmyqueriesinHive?
```
# See hadoop.md for details.
hadoop namenode -format

start-all.sh

beeline --debug

# Or use Hive CLI
# hive --debug
# --debug must come before any other options

# Set breakpoint in Eclipse. (Similar thing in IntelliJ.)
# Run -> Debug Configurations -> Remote Java Application -> localhost:8000
# Can debug from monolithic Hive Eclipse project (rather than the bajillion individual projects)

!connect jdbc:hive2://
# Blank username and password
```