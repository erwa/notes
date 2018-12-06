### JobFinishedEvent

```
private static JobFinishedEvent createJobFinishedEvent(JobImpl job)
```

`JobImpl` stores `finishTime`.


### Schema

Schemas defined in `Events.avpr` in `hadoop-mapreduce-client-core` project.

`Event` schema of `.jhist` file has two fields:

* `type` (an enum of 32 types)
* `event` (one of 18 types such as JobFinished, TaskUpdated, AMStarted)
* TaskFinished and JobFinished events have counter-related fields


### JobHistoryParser

`JobHistoryParser.parse()` ignores partial records.


### Structure

`.summary` file - jobId, submitTime, launchTime, finishTime, queue, jobName, numMaps, numReduces, etc. (generic and high-level information)

`.jhist` file - Avro-Json format. One record per Event. JOB_SUBMITTED, JOB_QUEUE_CHANGED, JOB_INITED, TASK_STARTED, MAP_ATTEMPT_STARTED, MAP_ATTEMPT_FINISHED, etc.

* counters are included in MAP_ATTEMPT_FINISHED, REDUCE_ATTEMPT_FINISHED, and JOB_FINISHED
* .jhist file parsed by JobHistoryParser and info stored in big JobInfo object.

`_conf.xml` file - same structure as Hadoop configuration file, like core-site.xml or hdfs-site.xml