### Testing a jobtype change

Restarting the exec-server should not be necessary once [#1817](https://github.com/azkaban/azkaban/issues/1817) is fixed.

```
# Replace the az-hadoop-jobtype-plugin jar in the current exec-server
bin/shutdown-exec.sh
bin/start-exec.sh

# Connect to Azkaban MySQL database and activated the new executor:
update executors set active=1 where id=129;

# Restart the web server
bin/shutdown-web.sh
bin/start-web.sh
```


### Remote debug

* In IDE, set breakpoint, and start remote debug (Listen)
* Get inet address from en0 from ifconfig
* Set `jvm.args` in Azkaban job to `-agentlib:jdwp=transport=dt_socket,server=n,address=<hostname>:5005,suspend=y`
* Start Azkaban job


### Run on specific executor

Get executor ID from Azkaban MySQL database:

```
select * from executors where active=1;
```

When running flow, add flow parameter `useExecutor=<id>`. Get `id` from `executors` table. Has to be flow parameter. Putting in in your .job file won't work.


### Fetch giant log

Go to `https://<host>:<port>/executor?execid=<execid>&jobId=<jobid>&ajax=fetchExecJobLogs&offset=0&length=2147483647&attempt=0`.

From job logs link, chang "job" to "jobId" and add `&ajax=fetchExecJobLogs&offset=0&length=2147483647&attempt=0`.


### Rerunning failed jobs

Go to failed execution -> Prepare Execution -> should only have failed jobs highlighted and will already have Flow Parameters populated from previous run.


### Find project/flow from execution id

Go to https://<host>:<port>/executor?execid=<execid>


### Enable DEBUG logging

In bin/azkaban-executor-start.sh, add to AZKABAN_OPTS
```
-Dlog4j.configuration=file:/path/to/custom/log4j.properties
```

Default log4j.properties is in lib/azkaban-execserver-3.0.0.jar