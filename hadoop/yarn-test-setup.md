### Test setup

```
# need to use yarn-daemon.sh start rather than start-yarn.sh on Mac
# https://stackoverflow.com/questions/33968422/bin-bash-bin-java-no-such-file-or-directory
sbin/stop-yarn.sh && sbin/yarn-daemon.sh start resourcemanager && sbin/yarn-daemon.sh start nodemanager
sbin/mr-jobhistory-daemon.sh start historyserver

# Restart RM
sbin/yarn-daemon.sh stop resourcemanager && sbin/yarn-daemon.sh start resourcemanager

# NodeManager already running, just need to restart RM
sbin/yarn-daemon.sh stop resourcemanager && sbin/yarn-daemon.sh start resourcemanager && tail -f logs/yarn-$USER-resourcemanager-`hostname`.log
```