### Run 1 test

```
activator "test-only com.linkedin.drelephant.tony.TonyMetricsAggregatorTest"
```

https://github.com/linkedin/dr-elephant/wiki/Developer-Guide


### Local setup

See https://github.com/linkedin/dr-elephant/wiki/Quick-Setup-Instructions-(Must-Read).

Setting up test app-conf

```
mkdir -p $HOME/test/dr-elephant-test/{app-conf,tony-conf-test,intermediate,finished}
# can copy over example app-conf

# copy over tony-site.xml from production cluster and modify it to point
# to local test history folders

# Run local TonY job
```

tony-site.xml

```
<configuration>
  <property>
    <name>tony.application.security.enabled</name>
    <value>false</value>
  </property>

  <property>
    <name>tony.history.location</name>
    <value>/Users/ahsu/test/dr-elephant-test</value>
  </property>

  <property>
    <name>tony.history.intermediate</name>
    <value>/Users/ahsu/test/dr-elephant-test/intermediate</value>
  </property>

  <property>
    <name>tony.history.finished</name>
    <value>/Users/ahsu/test/dr-elephant-test/finished</value>
  </property>
</configuration>
```

Starting Dr. Elephant

```
# Remove "clean" and "test" in the
# "play_command $OPTS clean compile test $extra_commands"
# line in compile.sh to speed up iteration.
./compile.sh compile.conf
cd dist
unzip dr-elephant-*.zip
cd dr-elephant-x.x.x

# start mysqld if not already started
mysqld

export TONY_CONF_DIR=$HOME/test/dr-elephant-test/tony-conf-test
bin/start.sh $HOME/test/dr-elephant-test/app-conf
```

Need TonY Portal set up to move intermediate jobs to finished.

```
cd $HOME/test/test-tony-portal/tony-portal-0.3.6
export TONY_CONF_DIR=$HOME/test/dr-elephant-test/tony-conf-test
bin/startTonyPortal.sh
```

Run TonY job

```
export TONY_CONF_DIR=$HOME/test/dr-elephant-test/tony-conf-test
java -cp `hadoop classpath`:$HOME/github/linkedin/TonY/tony-cli/build/libs/tony-cli-0.3.8-all.jar com.linkedin.tony.cli.ClusterSubmitter --executes="echo 'hi'" --conf_file=$HOME/test/test-tony/tony-test.xml
```


### Source Code

https://github.com/linkedin/dr-elephant


### IntelliJ Setup

https://www.jetbrains.com/help/idea/2017.1/getting-started-with-sbt.html#import_project

Delete any VM parameters related to Play, SBT, or Artifactory.