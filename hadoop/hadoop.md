### Security overview

https://issues.apache.org/jira/secure/attachment/12428537/security-design.pdf


### Specify node label

```
# MR
mapreduce.job.node-label-expression  # sets it for all containers
mapreduce.job.am.node-label-expression
mapreduce.map.node-label-expression
mapreduce.reduce.node-label-expression

# Spark
spark.yarn.am.nodeLabelExpression
spark.yarn.executor.nodeLabelExpression
```

https://developer.ibm.com/hadoop/2017/03/10/yarn-node-labels/


### Set number of reducers

```
set mapreduce.job.reduces=3;
```


### Get active conf

```
curl --negotiate -i -u : https://host:port/conf
```


### Task updates to ApplicationMaster

See Figure 6.5 in Hadoop: The Definitive Guide (3rd Edition).


### LeveldbTimelineStore vs. RollingLevelDBTimelineStore

Are identical in Hadoop 2.9.0.


### Set queue

```
# Hive
set mapreduce.job.queuename = my_custom_queue;
```


### Client to ApplicationMaster communication

Client should add ApplicationReport.getClientToAMToken to UGI.

```
LOG.info("Client to AM token: " + report.getClientToAMToken());
InetSocketAddress serviceAddr = NetUtils.createSocketAddrForHost(
    report.getHost(), report.getRpcPort());
if (UserGroupInformation.isSecurityEnabled()) {
  org.apache.hadoop.yarn.api.records.Token clientToAMToken = report.getClientToAMToken();
  Token<ClientToAMTokenIdentifier> token = ConverterUtils.convertFromYarn(clientToAMToken, serviceAddr);
  UserGroupInformation.getCurrentUser().addToken(token);
}
```


### Refresh proxy users

```
# kinit as user that ResourceManager is running as first
yarn rmadmin -refreshSuperUserGroupsConfiguration
```


### Task timeout

Can set to 0 to fix "Timed out after 600 secs" issue

```
mapreduce.task.timeout
```


### Classloader / classpath related variables

```
mapreduce.job.classloader

# default system classes present in
# org.apache.hadoop.application-classloader.properties
mapreduce.job.classloader.system.classes

mapreduce.job.user.classpath.first
```


### Have job succeed even if some percentage of mappers fail.

Set `mapreduce.map.failures.maxpercent`.


### Web Proxy / Web Application Proxy

Responsibility of the Application Master to provide a web UI to the Resource Manager.

https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/WebApplicationProxy.html


### Multiple writer, single reader

Make directory `rwx-wx-wx`. Anyone can write to it, but users can only delete or rename files if they can guess the path inside. However, directories cannot be deleted or renamed unless the user has write permission to the directory.


### World writeable directory

You can move and delete files and directories inside, but you can't read the contents.


### HDFS Permissions Group Inheritance Example

* dir1 is rwxrwxrwx u1/g1
* u2, part of g2 but not part of g1, writes to dir1/foo
* dir1/foo has rw-r----- u2/g1  permissions
* u2 can chgrp g2 on dir1/foo so it ends up with rw-r----- u2/g2


### Superuser vs. proxyuser

Super users can set any permissions, owners, and groups they want. No permission checks apply.

Proxy users can proxy as any other user, but permissions still apply normally, both to the proxy user and to the user they proxy as.

* https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsPermissionsGuide.html#The_Super-User
* https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/Superusers.html


### Write to multiple OutputFormats

Use MultipleOutputs: https://hadoop.apache.org/docs/current/api/org/apache/hadoop/mapreduce/lib/output/MultipleOutputs.html


### Counters

"Total megabyte-seconds taken by all map tasks" is really MB_MILLIS_MAPS. The description should read "megabyte-milliseconds"


### Mailing Lists

https://hadoop.apache.org/mailing_lists.html


### Dependencies

Specified in hadoop-project/pom.xml.


### DistributedCache

NodeManager has ContainerManager that uses ResourceLocalizationService. ResourceLocalizationService has LocalizedRunner that has addResource() method which uses FSDownload to localize file.

Look at `mapreduce.job.cache.files` property in job conf to see what files were added to the cache.


### Split size

When using CombineFileInputFormat, max split size controlled by `mapreduce.input.fileinputformat.split.maxsize`. Set to 0 (default) to combine all data into one split.

Relevant parameters:

```
mapreduce.input.fileinputformat.split.maxsize
mapreduce.input.fileinputformat.split.minsize.per.node
mapreduce.input.fileinputformat.split.minsize.per.rack
```

`mapreduce.input.fileinputformat.split.minsize` does NOT matter; only matters for FileInputFormat.

Way CombineFileInputFormat algorithm works:

1. for each node, group blocks together into splits of at least maxsize
2. for any remaining blocks on a node, if the sum of their sizes exceeds minsize.per.node, group them together into a split
3. for any remaining blocks on a rack, if the sum of their sizes exceeds minsize.per.rack, group them together into a split
4. for any remaining blocks across rocks, group them together into splits of at least maxsize
5. group all remaining blocks into one final split


### Copy files

```
FileUtil.copy(srcFs, srcPath, destFs, destPath, false, c);
```

http://stackoverflow.com/questions/35806830/how-to-copy-a-file-from-one-hdfs-folder-to-another-hdfs-folder-using-java-api


### Host job was submitted from

`mapreduce.job.submithostname` in job conf


### Set replication factor of a file

```
dfs.replication=1
```

http://stackoverflow.com/questions/30558217/to-change-replication-factor-of-a-directory-in-hadoop


### Get replication factor of a file

```
hadoop fs -ls # Look at 2nd column
```


### Eclipse setup

* Remove any existing .classpath and .project files.
* Re-add the project in Eclipse.
* Make sure you don't accidentally "Build project" or else the bin folder will get overridden with compiled classes.

* version 0.20S = 1.2.1
* version 0.23 = 2.x


### Enable more logging

```
export HADOOP_ROOT_LOGGER=DEBUG,console
```


### EOFException

https://wiki.apache.org/hadoop/EOFException


### Disable `_SUCCESS` file

To disable the `_SUCCESS` file from being created upon job completion, set the `mapreduce.fileoutputcommitter.marksuccessfuljobs` property to `false`. See http://mail-archives.apache.org/mod_mbox/hadoop-user/201305.mbox/%3CCAO7hTbNSu7vJ5nori9u3+r9px_xkkgO=+Of248x=ujC0tNZpuA@mail.gmail.com%3E.


### Increase client heap size

```
export HADOOP_CLIENT_OPTS="-Xmx10g"
```

https://help.sap.com/viewer/50f26aa0f2044127bc5f6d5ad3d090fe/Cloud/en-US/2e66371176b8101480abd76da746ffe7.html


### Put user classpath first

Set `mapreduce.user.classpath.first` to `true`. See http://stackoverflow.com/questions/11685949/overriding-default-hadoop-jars-in-class-path.


### Hadoop 1.2.1

Hadoop setup on Mac

http://stackoverflow.com/questions/7134723/hadoop-on-osx-unable-to-load-realm-info-from-scdynamicstore

To fix “Unable to load realm info from SCDynamicStore” error, add this to hadoop-env.sh

```
export HADOOP_OPTS="-Djava.security.krb5.realm= -Djava.security.krb5.kdc="
```

To suppress "$HADOOP_HOME is deprecated" warning message, add the follow to hadoop-env.sh

```
export HADOOP_HOME_WARN_SUPPRESS="TRUE"
```

http://stackoverflow.com/questions/3425688/why-does-the-hadoop-incompatible-namespaceids-issue-happen
http://www.michael-noll.com/tutorials/running-hadoop-on-ubuntu-linux-multi-node-cluster/#javaioioexception-incompatible-namespaceids


### Reformat the namenode

```
hadoop namenode -format
```

You may need to delete the hadoop tmp and dfs.data.dir directories.

For Hadoop local (single process) mode, just leave core-site.xml, hdfs-site.xml, and mapred-site.xml empty.

Don't forget to set JAVA_HOME in conf/hadoop-env.sh

To avoid having to type your password when launching the daemons, append `.ssh/*.pub` to `.ssh/authorized_keys`.

Using curl to contact a secure WebHDFS instance
http://www.adaltas.com/blog/2013/09/25/webhdfs-security-kerberos-delegation-tokens/

```
curl --negotiate -u : "http://<nn>:50070/webhdfs/v1/user/ahsu/test?op=LISTSTATUS"
```

Get delegation token

```
curl --negotiate -u : -L "http://NAMENODE_HOST:50070/webhdfs/v1/?op=GETDELEGATIONTOKEN&user.name=USER"
```


### To leave safemode

```
hadoop dfsadmin -safemode leave
```


### Hadoop 2.3.0

http://hadoop.apache.org/docs/r2.4.1/hadoop-project-dist/hadoop-common/SingleNodeSetup.html
(2.3.0 redirects to 2.4.1)


### Passwordless SSH

Ensure the public keys in `~/.ssh` are appended to `~/.ssh/authorized_keys`.


### Setup

```
bin/hadoop namenode -format

bin/start-all.sh

# To verify
jps
# There should be 5 processes:
# NN, SNN, DN, RM, NM
```
NameNode UI running at http://localhost:50070


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

```
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
```

core-site.xml

```
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
```

hdfs-site.xml

```
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
```

mapred-site.xml

```
<configuration>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
</configuration>
```

yarn-site.xml

```
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
```

```
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
```


### Word count example

Copy conf directory to HDFS

```
hadoop fs -put etc/hadoop/ conf

# overwrite destination using -f
hadoop fs -put -f <src> <dst>
```

Run word count

```
yarn jar /export/apps/hadoop-2.3.0_li-SNAPSHOT/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.3.0_li-SNAPSHOT.jar wordcount conf conf-out
```


### Increase memory of tasks

```
set mapred.job.map.memory.mb 4096;
set mapred.job.reduce.memory.mb 4096;
set mapred.child.java.opts '-Xmx3G -Djava.net.preferIPv4Stack=true';
```


### Find job given application id

The /proxy/application_xxx_xxx URL often expires quickly
Look for the Hadoop job id job_xxx_xxx (the xxx_xxx will match the xxx_xxx part in the application URL)
Search for the job on the Job History Server


### Deprecated properties between Hadoop 1 and Hadoop 2

http://hadoop.apache.org/docs/r2.3.0/hadoop-project-dist/hadoop-common/DeprecatedProperties.html


### `java.net.ConnectException: Connection refused`

http://wiki.apache.org/hadoop/ConnectionRefused

Check /etc/hosts and remove any line that maps 127.0.0.1 to your hostname.


### Kill running YARN application

```
yarn application -kill application_XXX_XXX
```


### Get help on shell command

```
hadoop fs -help put
```


### `yarn.application.classpath`

`YARN_APPLICATION_CLASSPATH`.


### FileSystem loaded using ServiceLoader API

* hadoop-common jar's `META-INF/services/org.apache.hadoop.fs.FileSystem` file contains
```
org.apache.hadoop.fs.LocalFileSystem
org.apache.hadoop.fs.viewfs.ViewFileSystem
org.apache.hadoop.fs.s3.S3FileSystem
org.apache.hadoop.fs.s3native.NativeS3FileSystem
org.apache.hadoop.fs.ftp.FTPFileSystem
org.apache.hadoop.fs.HarFileSystem
```
* hadoop-hdfs jar's `META-INF/services/org.apache.hadoop.fs.FileSystem` file contains
```
org.apache.hadoop.hdfs.DistributedFileSystem
org.apache.hadoop.hdfs.web.HftpFileSystem
org.apache.hadoop.hdfs.web.HsftpFileSystem
org.apache.hadoop.hdfs.web.WebHdfsFileSystem
org.apache.hadoop.hdfs.web.SWebHdfsFileSystem
```

### Hadoop Archive (HAR) Files

```
hadoop fs -ls har:///path/to/file
```

You can access individual files within a HAR.
http://www.aosabook.org/en/hdfs.html


### Get Yarn application logs

```
# Only works after application finishes
# Gets logs for ALL containers
yarn logs -applicationId application_X_Y

# To filter, use
yarn logs -applicationId application_X_Y -nodeAddres host.example.com:123 -containerId container_X_Y_Z_A

yarn logs # See options
```