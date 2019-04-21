### FileSystem with security / HDFS with security

Need to do `UserGroupInformation.loginUserFromKeytab()` before initializing the FileSystem, or else you'll get an exception like

```
Caused by: org.apache.hadoop.ipc.RemoteException: SIMPLE authentication is not enabled.  Available:[TOKEN, KERBEROS]
```


### Symlinks

Disabled as of 2.2.0: https://issues.apache.org/jira/browse/HADOOP-10019


### Quota check

```
hdfs dfs -count -q -h -v  /user/foo/*
```


### Sticky bit

```
hdfs dfs -chmod 1777 /tmp
```

Prevents anyone except the superuser, directory owner, or file owner from deleting or moving the files within the directory.

https://www.cloudera.com/documentation/enterprise/5-9-x/topics/cdh_sg_sticky_bit_set.html