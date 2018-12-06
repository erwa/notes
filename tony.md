### Example

Start YARN using:

```
$HADOOP_HOME/sbin/start-yarn.sh
```

tony-test.xml

```
<configuration>
  <property>
    <name>tony.application.security.enabled</name>
    <value>false</value>
  </property>
  <property>
    <name>tony.history.location</name>
    <value>/Users/ahsu/github/erwa/erwa-TonY/test/tony-history</value>
  </property>
</configuration>
```

```
java -cp `hadoop classpath`:/Users/ahsu/github/erwa/erwa-TonY/tony-cli/build/libs/tony-cli-0.1.5-all.jar com.linkedin.tony.cli.ClusterSubmitter \
--src_dir=/Users/ahsu/github/erwa/erwa-TonY/tony-core/src/test/resources \
--executes=/Users/ahsu/github/erwa/erwa-TonY/tony-core/src/test/resources/exit_0.py \
--conf_file=/Users/ahsu/github/erwa/erwa-TonY/test/tony-test.xml \
--python_binary_path=/export/apps/python/2.7/bin/python2.7
```