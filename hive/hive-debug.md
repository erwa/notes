### Minimal Hive Driver testing

```
import org.apache.hadoop.hive.conf.HiveConf;
import org.apache.hadoop.hive.ql.Driver;
import org.apache.hadoop.hive.ql.session.SessionState;

public class DriverTest {
  public static void main(String[] args) throws CommandNeedRetryException {
    String krb5ConfFile = new File(DriverTest.class.getClassLoader().getResource("krb5.conf").getFile())
        .getAbsolutePath();
    System.setProperty("java.security.krb5.conf", krb5ConfFile);

    HiveConf conf = new HiveConf();
    conf.setVar(HiveConf.ConfVars.METASTOREWAREHOUSE, System.getProperty("user.home") + "/warehouse");
    Driver driver = new Driver(conf);
    SessionState.start(conf);
    driver.init();
    driver.run("CREATE TABLE t (a int)");
  }
}
```


### IncompatibleClassChangeError: Implementing class

Ensure avro-tools jar (which fat jars old Hadoop classes) is not on classpath.

http://stackoverflow.com/questions/23332022/hive-0-12-0-incompatibleclasschangeerror


### Enable Ivy logging

```
hive --hiveconf ivy.message.logger.level=4
```


### Set up only required tables for TestCliDriver
Create .q file in data/scripts that contains only the tables you need. In the static initialization block in TestCliDriver, change initScript to your custom script.

Backport https://issues.apache.org/jira/browse/HIVE-11538.


### Test warehouse dir

`test.warehouse.dir` set in root pom.xml. Generally `itests/qtest/target/warehouse`.


### Change logging level

To debug Hive and print more info:

```
hive -hiveconf hive.root.logger=INFO,console
```

You can also change log level and output location in `conf/hive-log4j.properties`

```
hive.root.logger=DEBUG,DRFA,console

# disable logging for a class
log4j.logger.org.apache.hadoop=OFF
log4j.logger.org.apache.thrift=OFF
```

To use a different Hive config:

```
export HIVE_HOME=/export/home/ahsu/hive-0.12.0.li.new

# only supports local filesystem
export HIVE_AUX_JARS_PATH=$HIVE_HOME/aux/lib

export PATH=$HIVE_HOME/bin:$PATH
hive
# run your query
```


### Debug metastore

```
hive --debug --service metastore
```


### Debug in IntelliJ

```
hive --debug
```

Run -> Edit Configurations -> + -> Remote -> change port to 8000 -> OK. Click "Debug" symbol to start debugging.

http://stackoverflow.com/questions/21114066/attach-intellij-idea-debugger-to-a-running-java-process


### Debug query in Eclipse

https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-HowdoIdebugmyqueriesinHive?

```
# See hadoop.md for details.
hadoop namenode -format

start-all.sh

beeline --debug

# Or use Hive CLI
# hive --debug
# --debug must come before any other options

# Set breakpoint in Eclipse. (Similar thing in IntelliJ.)
# Run -> Debug Configurations -> Remote Java Application -> localhost:8000
# Can debug from monolithic Hive Eclipse project (rather than the bajillion individual projects)

!connect jdbc:hive2://
# Blank username and password
```