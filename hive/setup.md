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