### Hive Eclipse 0.13 Setup

See https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-HowdoIimportintoeclipse?.
```
mkdir workspace
cd workspace
git clone https://github.com/apache/hive.git
cd hive
mvn clean install -DskipTests -Phadoop-2
mvn eclipse:clean
mvn eclipse:eclipse -DdownloadSources -DdownloadJavadocs -Phadoop-2
cd itests
mvn clean install -DskipTests -Phadoop-2
mvn eclipse:clean
mvn eclipse:eclipse -DdownloadSources -DdownloadJavadocs -Phadoop-2
```

When importing into Eclipse, use Import -> Existing Projects, NOT New -> Java Project. Make sure to enable project specific save settings and disable save actions.

CliDriver runtime program arguments
```
--hiveconf datanucleus.connectiondrivername=org.apache.derby.jdbc.EmbeddedDriver
```

To fix issue
```
The class "org.apache.hadoop.hive.metastore.model.MVersionTable" is not persistable.
```
as suggested by [HIVE-6113](https://issues.apache.org/jira/browse/HIVE-6113), upgrade datanucleus jars:
```
datanucleus-api-jdo 3.2.6 ---> 4.2.1
datanucleus-core 3.2.10 ---> 4.1.6
datanucleus-rdbms 3.2.9 ---> 4.1.7
```
Add to beginning of runtime classpath.

Now other problems...

### Hive trunk Eclipse maven configuration

CliDriver Classpath:
- /home/ahsu/github/erwa/hive/hive/conf
- /export/apps/hadoop/latest/conf
- hive-metastore-0.14.0-SNAPSHOT.jar
- hadoop-{core,test,tools}-1.2.1.jar
- hive-cli (default classpath)

Program arguments:
* Initially none
* I added:
```
--hiveconf javax.jdo.option.ConnectionURL=jdbc:derby:;databaseName=/home/ahsu/metastore_db;create=true
```
* VM arguments:
```
# initially
-Xms256m -Xmx1024m -XX:-UseSplitVerifier -Dhive.root.logger=INFO,console -Dhadoop.bin.path=/home/ahsu/gitli/ahsu-hive/testutils/hadoop

# After my changes:
-Xms256m -Xmx1024m -XX:-UseSplitVerifier -Dhive.root.logger=INFO,console -Dhadoop.bin.path=/export/apps/hadoop/latest/bin/hadoop
```

Initially, you might have to build twice for errors to go away.
* Try clean after first build before building again
* `commons-codec` .classpath library reference needs to be updated to newer version (also in the source tree), which has a new class StringUtils
* Added /export/apps/hadoop/latest/conf to my HiveCLI run config classpath
* Added /export/apps/hadoop/latest/hadoop-{core,test,tools}-1.2.1.jar to classpath
* Added commons-configuration

### Debug Hive unit test from Eclipse
You may need to create a `hive-site.xml` somewhere with the custom properties you need and then add the containing folder to your debug classpath. If you need to attach source, you can add a Variable for your Git repository, and add an extension to the folder that contains the classes. When making changes, you may need to rebuild the project (sometimes from Eclipse and sometimes from the command line) for changes to take effect.