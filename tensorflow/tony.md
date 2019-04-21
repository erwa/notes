### Build TonY History Server zip

```
./gradlew :tony-history-server:createPlayBinaryZipDist
```


### Estimator configuration example

```
tony.chief.instances = 1
tony.worker.instances = 1
tony.evaluator.instances = 1
tony.ps.instances = 1

tony.chief.gpus = 1
tony.worker.gpus = 1
tony.evaluator.gpus = 1
# no GPUs needed for PS
```


### Build without running tests

```
./gradlew build -x test -x testPlayBinary
```


### Dataproc how-to

https://github.com/GoogleCloudPlatform/dataproc-initialization-actions/pull/413/files


### Run 1 test

```
./gradlew :tony-core:test --tests *TestTonyE2E.testTensorBoardPortSetOnlyOnChiefWorker
```

Test logs will be in `./target/MiniTonY/...`


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
java -cp `hadoop classpath`:/Users/ahsu/github/linkedin/TonY/tony-cli/build/libs/tony-cli-0.2.0-all.jar com.linkedin.tony.cli.ClusterSubmitter \
--src_dir=/Users/ahsu/github/linkedin/TonY/tony-core/src/test/resources/scripts \
--executes=exit_0.py \
--conf_file=/Users/ahsu/test/test-tony/tony-test.xml \
--python_binary_path=/export/apps/python/2.7/bin/python2.7
```


### nvidia-smi example

test_nvidiasmi.py

```
import subprocess
import sys

print('about to run nvidia-smi')
subprocess.Popen('nvidia-smi').wait()
print('about to exit')
sys.exit(0)
```

tony.xml

```
<configuration>
  <property>
    <name>tony.worker.instances</name>
    <value>2</value>
  </property>
  <property>
    <name>tony.worker.gpus</name>
    <value>1</value>
  </property>
  <property>
    <name>tony.application.node-label</name>
    <value>test</value>
  </property>
</configuration>
```

```
java -cp `hadoop classpath`:/path/to/tony-cli-0.2.0-all.jar com.linkedin.tony.cli.ClusterSubmitter \
--src_dir=src \
--executes=test_nvidiasmi.py \
--conf_file=tony.xml \
--python_binary_path=python2.7
```