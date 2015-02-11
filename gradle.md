### List all available tasks
```
gradle tasks
```

### Set environment variable in unit test
```
test {
  environment("VAR_NAME", "VAR_VALUE")
}
```

### Configurations
Gradle always executes all configurations, meaning if you have a print statement in a task configuration, it will always get executed. See http://codespelunker.blogspot.com/2013/02/gradle-configuration-vs-execution.html.
```
task newTask  {
  print "You will see this in the configuration phase"
}
```

`<<` is syntactic sugar for doLast.
```
task newTask(type: Copy) << {
  print "You will only see this in the execution phase"
}
```

Literal doLast example:
```
task copyFiles (type: Copy) {
  from "srcDir"
  into "destDir"
  doLast {
    println "copying files"
  }
}
```

### Get test runtime classpath
See http://forums.gradle.org/gradle/topics/how_to_add_to_a_test_classpath.
```
files = project.sourceSets.test.runtimeClasspath
for (File file : files) {
  print file
}
```

### JavaExec task
See http://forums.gradle.org/gradle/topics/how_to_use_in_gradle_javaexec_with_classpath_dependency.
```
javaexec {
    classpath project.configurations.buildDependencies
    main = "com.simontuffs.onejar.Boot"
    args = [
        "install",
        ampFile,
        warFile,
        "-force",
        "-nobackup"
    ].toList()
}
```

### Exclude a task
```
gradle -x <task>
```

### Build with Java 7
```
export JAVA_HOME=/export/apps/jdk/JDK-1_7_0_21
```

### Print all dependencies (including transitive ones)
Make sure to execute this command from the project itself. See http://stackoverflow.com/questions/12288133/what-is-gradle-artifact-dependency-graph-command.
```
gradle dependencies
```

### Depend on latest version
Use a `+`. See http://www.gradle.org/docs/current/userguide/dependency_management.html#sec:dependency_resolution.
```
compile 'junit:junit:4.8.+'
```

### Check for property's existence
```
hasProperty('property')
```

### Get tasks Gradle was launched with
```
gradle.startParameter.taskNames
```

### Default Evaluation Order
The default evaluation order of projects is alphanumeric (for the same nesting level). See http://www.gradle.org/docs/current/userguide/multi_project_builds.html#sub:configuration_time_dependencies. The evaluation order can be set by adding
```
evaluationDependsOn(':otherProject')
```