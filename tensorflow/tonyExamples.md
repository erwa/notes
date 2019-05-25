### venv

```
--python_venv=$HOME/test/test-virtualenv/test-tony/venv.zip
```


### Run shell command

```
java -cp `hadoop classpath`:$HOME/git/TonY/tony-cli/build/libs/tony-cli-0.3.0-all.jar com.linkedin.tony.cli.ClusterSubmitter \
--executes="sleep infinity" \
--conf_file=$HOME/tony-test/tony-test.xml

export TONY_CONF_DIR=$HOME/test/dr-elephant-test/tony-conf-test
java -cp `hadoop classpath`:$HOME/github/linkedin/TonY/tony-cli/build/libs/tony-cli-0.3.8-all.jar com.linkedin.tony.cli.ClusterSubmitter --executes="echo 'hi'" --conf_file=$HOME/test/test-tony/tony-test.xml
```


### Google Cloud Platform Dataproc

tony-test.xml

```
<configuration>
  <property>
    <name>tony.application.single-node</name>
    <value>true</value>
  </property>
  <property>
    <name>tony.application.security.enabled</name>
    <value>false</value>
  </property>
</configuration>
```

exit_0.py

```
import time
time.sleep(1)
exit(0)
```

```
# run from master
java -cp `hadoop classpath`:$HOME/git/TonY/tony-cli/build/libs/tony-cli-0.3.0-all.jar com.linkedin.tony.cli.ClusterSubmitter \
--src_dir=$HOME/tony-test/src \
--executes=exit_0.py \
--conf_file=$HOME/tony-test/tony-test.xml \
--python_binary_path=python
```