### Local Setup
https://cwiki.apache.org/confluence/display/Hive/GettingStarted#GettingStarted-RunningHive

Start Hadoop daemons.
```
hadoop fs -mkdir /tmp
hadoop fs -mkdir -p /user/hive/warehouse
hadoop fs -chmod g+w /tmp
hadoop fs -chmod g+w /user/hive/warehouse
```

Run HiveServer2 and Beeline in separate processes:
```
# In one window
bin/hiveserver2

# In another window
bin/beeline -u jdbc:hive2://localhost:10000
```

Run (embedded) HiveServer2 and Beeline in same process:
```
beeline -u jdbc:hive2://
```


### Standalone local metastore
```
hive --service metastore

# To stop, press Ctrl + C
```

Add follow to hive-site.xml to allow clients to connect:
```
    <property>
      <name>hive.metastore.uris</name>
      <value>thrift://localhost:9083</value>
    </property>
```

Connect using Beeline with embedded HiveServer2:
```
beeline -u jdbc:hive2://
```

### Configure logging
Copy hive-log4j.properties.template to hive-log4j.properties. In trunk, it's hive-log4j2.properties.

To enable printing to console, change
```
log4j.rootLogger=${hive.root.logger}, EventCounter
```
to
```
log4j.rootLogger=${hive.root.logger}, console
```