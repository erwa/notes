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
./gradlew cleanIdea idea
```

File -> Open -> <Gobblin root folder>
May have to mark folders as Source or Test Source.

Install Lombok IntelliJ plugin to build and test in IntelliJ. See "Installation" steps at https://github.com/mplushnikov/lombok-intellij-plugin. 5-minute setup.