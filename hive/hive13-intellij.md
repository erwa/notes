### IntelliJ setup
Open the root pom.xml in IntelliJ.
```
File -> Open -> pom.xml
```

View -> Tool Windows -> Maven Projects -> Profiles -> Check the "hadoop-2" and "maven-3" profiles.

You should now be able to build the entire project in IntelliJ and debug tests.

Unable to fix the `org.datanucleus.exceptions.ClassNotPersistableException: The
class "org.apache.hadoop.hive.metastore.model.MVersionTable"` issue: http://mail-archives.apache.org/mod_mbox/hive-user/201506.mbox/%3CCANKHNWSfKLMMbTCqfxcqj21_WH1sjFL1jrf1GKY1eS=Erf9gXg@mail.gmail.com%3E