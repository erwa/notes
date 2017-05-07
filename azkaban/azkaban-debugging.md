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