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