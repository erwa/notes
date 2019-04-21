### YARN with Job History Server

Tested with Hadoop 2.9.0

Key configurations:

yarn-site.xml

```
  <property>
    <name>yarn.resourcemanager.application-master-service.processors</name>
    <value>MaxContainerAMSProcessor</value>
  </property>
```

mapred-site.xml

```
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
```

```
# start RM and NM
sbin/yarn-daemon.sh start resourcemanager && sbin/yarn-daemon.sh start nodemanager

# start JHS (note different script than for RM and NM)
sbin/mr-jobhistory-daemon.sh start historyserver

# to stop everything
sbin/stop-yarn.sh
```