# General

# Get replication factor of a file
hadoop fs -ls # Look at 2nd column

# Eclipse setup
# Remove any existing .classpath and .project files.
# Re-add the project in Eclipse.
# Make sure you don't accidentally "Build project" or else the bin folder will get overridden with compiled classes.

# version 0.20S = 1.2.1
# version 0.23 = 2.x

# Enable more logging
export HADOOP_ROOT_LOGGER=DEBUG,console

# EOFException
# https://wiki.apache.org/hadoop/EOFException

###
Disable _SUCCESS file:
To disable the `_SUCCESS` file from being created upon job completion, set the `mapreduce.fileoutputcommitter.marksuccessfuljobs` property to `false`. See http://mail-archives.apache.org/mod_mbox/hadoop-user/201305.mbox/%3CCAO7hTbNSu7vJ5nori9u3+r9px_xkkgO=+Of248x=ujC0tNZpuA@mail.gmail.com%3E.

################
# Hadoop 1.2.1 #
################

# Hadoop setup on Mac
# http://stackoverflow.com/questions/7134723/hadoop-on-osx-unable-to-load-realm-info-from-scdynamicstore
# To fix “Unable to load realm info from SCDynamicStore” error, add this to hadoop-env.sh
export HADOOP_OPTS="-Djava.security.krb5.realm= -Djava.security.krb5.kdc="

# To suppress "$HADOOP_HOME is deprecated" warning message, add the follow to hadoop-env.sh
export HADOOP_HOME_WARN_SUPPRESS="TRUE"

# http://stackoverflow.com/questions/3425688/why-does-the-hadoop-incompatible-namespaceids-issue-happen
# http://www.michael-noll.com/tutorials/running-hadoop-on-ubuntu-linux-multi-node-cluster/#javaioioexception-incompatible-namespaceids
# Reformat the namenode
hadoop namenode -format
# You may need to delete the hadoop tmp and dfs.data.dir directories.

# For Hadoop local (single process) mode, just leave core-site.xml, hdfs-site.xml, and mapred-site.xml empty.

# Don't forget to set JAVA_HOME in conf/hadoop-env.sh

# To avoid having to type your password when launching the daemons, append .ssh/*.pub to .ssh/authorized_keys

# Using curl to contact a secure WebHDFS instance
# http://www.adaltas.com/blog/2013/09/25/webhdfs-security-kerberos-delegation-tokens/
curl --negotiate -u : "http://<nn>:50070/webhdfs/v1/user/ahsu/test?op=LISTSTATUS"

# To leave safemode
hadoop dfsadmin -safemode leave


# Hadoop 2.3.0

### Eclipse Setup
You must use Java 7 to compile.
```
export JAVA_HOME=/export/apps/jdk/JDK-1_7_0_21
```

Install `protobuf-2.5.0`. If you copy a Linux installation to OS X, it probably won't work.
```
export HADOOP_PROTOC_PATH=/opt/protobuf/protobuf-2.5.0/bin/protoc
```

Build

# Make sure you don't have environment variables from Hadoop 1.x still set
env | grep -i home
env | grep -i conf

# hadoop-env.sh script
export HADOOP_HOME=/export/apps/hadoop-2.3.0_li-SNAPSHOT
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop

# To set env using hadoop-env.sh script
source hadoop-env.sh

# Make sure you have stopped all the Hadoop 1.x daemons
jps # to check

# Run this from Hadoop base directory
mvn clean package  -Pdist -DskipTests -Dtar -Dmaven.javadoc.skip=true
# This will create tarballs for all the components.
# The tarball we care about is in hadoop-dist/target
# Copy it to the location you want to install Hadoop and extract it.

# Conf is in etc/hadoop
# core-site.xml
<configuration>
  <property>
    <name>fs.default.name</name>
    <value>hdfs://localhost:9000</value>
  </property>
  <property>
    <name>hadoop.tmp.dir</name>
    <value>/home/ahsu/hadoop2-tmp</value>
  </property>
</configuration>

# hdfs-site.xml
<configuration>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
  <property>
    <name>dfs.permissions</name>
    <value>false</value>
  </property>
</configuration>

# mapred-site.xml
<configuration>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
</configuration>

# yarn-site.xml
<configuration>
<!-- Site specific YARN configuration properties -->
  <property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
  </property>
  <property>
    <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
    <value>org.apache.hadoop.mapred.ShuffleHandler</value>
  </property>
</configuration>

# Before namenode can start, you must format the hadoop.tmp.dir
hadoop namenode -format

# Create a start-all.sh in bin directory with these contents
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/hadoop-daemon.sh start namenode
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/hadoop-daemons.sh start datanode
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/yarn-daemon.sh start resourcemanager
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/yarn-daemons.sh start nodemanager
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/mr-jobhistory-daemon.sh start historyserver

# Create a stop-all.sh in bin directory with these contents
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/mr-jobhistory-daemon.sh stop historyserver
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/yarn-daemons.sh stop nodemanager
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/yarn-daemons.sh stop resourcemanager
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/hadoop-daemons.sh stop datanode
/export/apps/hadoop-2.3.0_li-SNAPSHOT/sbin/hadoop-daemon.sh stop namenode

# Running example job
# Pi job (no files required)
yarn jar /export/apps/hadoop-2.3.0_li-SNAPSHOT/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.3.0_li-SNAPSHOT.jar pi 2 100

# Word count example
# Copy conf directory to HDFS
hadoop fs -put etc/hadoop/ conf
# Run word count
yarn jar /export/apps/hadoop-2.3.0_li-SNAPSHOT/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.3.0_li-SNAPSHOT.jar wordcount conf conf-out

# Increase memory of tasks
set mapred.job.map.memory.mb 4096;
set mapred.job.reduce.memory.mb 4096;
set mapred.child.java.opts '-Xmx3G -Djava.net.preferIPv4Stack=true';

# Find job given application id
# The /proxy/application_xxx_xxx URL often expires quickly
# Look for the Hadoop job id job_xxx_xxx (the xxx_xxx will match the xxx_xxx part in the application URL)
# Search for the job on the Job History Server

# Deprecated properties between Hadoop 1 and Hadoop 2:
# http://hadoop.apache.org/docs/r2.3.0/hadoop-project-dist/hadoop-common/DeprecatedProperties.html