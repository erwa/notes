### History Server REST API

http://<host>:<port>/ws/v1/history/mapreduce/jobs/<job_id>

https://hadoop.apache.org/docs/r2.7.4/hadoop-mapreduce-client/hadoop-mapreduce-client-hs/HistoryServerRest.html#Jobs_API


### Task progress updates

Task.TaskReporter.run()

Every 3 seconds, send update including counter updates.

updateResourceCounters() updates memory and CPU counters.

TaskAttemptListenerImpl.statusUpdate() sends the updated progress and counters to the AM via a TaskAttemptStatusUpdateEvent, which is handled by the TaskAttemptEventDispatcher in MRAppMaster, which calls TaskAttemptImpl.handle(TaskAttemptEvent).