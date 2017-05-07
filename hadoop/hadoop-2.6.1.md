### Start HDFS
* Ensure password SSH to localhost.

core-site.xml
```
<configuration>
  <property>
    <name>fs.default.name</name>
    <value>hdfs://localhost:9000</value>
  </property>
  <property>
    <name>hadoop.tmp.dir</name>
    <value>${user.home}/hadoop-tmp</value>
  </property>
</configuration>
```

hdfs-site.xml
```
<configuration>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
  <property>
    <name>dfs.name.dir</name>
    <value>${user.home}/hdfs</value>
  </property>
</configuration>
```

```
hadoop namenode format
cd $HADOOP_HOME/sbin
start-dfs.sh

# if you encounter problems starting DataNode
rm -rf $HOME/hadoop-tmp
```