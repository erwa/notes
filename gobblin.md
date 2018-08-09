### Minimal TaskContext setup

```
WorkUnitState wus = new WorkUnitState(WorkUnit.createEmpty(), new State(),
    Mockito.mock(SharedResourcesBroker.class));
wus.setProp(ConfigurationKeys.JOB_NAME_KEY, "jobName");
wus.setProp(ConfigurationKeys.JOB_ID_KEY, "jobId");
wus.setProp(ConfigurationKeys.TASK_ID_KEY, "taskId");
TaskContext taskContext = new TaskContext(wus);
```


### Task Factory

A Source creates WorkUnits, and each WorkUnit (which extends State) can set its own `org.apache.gobblin.runtime.taskFactoryClass` task factory class. The `TaskFactory` has createTask() and createDataPublisher() methods.


### Annotation Preprocessing

Uses Lombok's `@Slfj` annotation to automatically generate a `Logger` for a class.


### Simulate / Test Hive execution

```
# doesn't simulate everything, but does simulate Hive queries
hive.execution.simulate=true
```


### General

Source: https://github.com/linkedin/gobblin
Docs: http://gobblin.readthedocs.io/


### IntelliJ setup

```
# Run build from command line first to generate all required classes
./gradlew build -x findbugsMain -x test -x rat -x checkstyleMain

./gradlew cleanIdea idea
```

File -> Open -> <Gobblin root folder>
May have to mark folders as Source or Test Source.

Install Lombok IntelliJ plugin to build and test in IntelliJ. See "Installation" steps at https://github.com/mplushnikov/lombok-intellij-plugin. 5-minute setup.