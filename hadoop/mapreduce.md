### Task progress updates

Task.TaskReporter.run()

Every 3 seconds, send update including counter updates.

updateResourceCounters() updates memory and CPU counters.

TaskAttemptListenerImpl.statusUpdate() sends the updated progress and counters to the AM via a TaskAttemptStatusUpdateEvent, which is handled by the TaskAttemptEventDispatcher in MRAppMaster, which calls TaskAttemptImpl.handle(TaskAttemptEvent).