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

