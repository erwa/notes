### List all available tasks
```
gradle tasks
```

### Get task by name
```
tasks.getByPath('foo').dependsOn(bar)
```
https://docs.gradle.org/current/userguide/more_about_tasks.html#accessUsingPath

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
def execResult = javaexec {
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

### Exclude a package
* http://stackoverflow.com/questions/19575474/gradle-how-to-exclude-a-particular-package-from-a-jar

```
jar {
    exclude('mi/package/excluded/**')
    exclude('mi/package/excluded2/**')
}
```

### Exclude dependency from configuration
```
configurations.CONFIG_NAME.exclude group: 'com.foo', module: 'foo'
```
http://stackoverflow.com/questions/9918568/gradle-exclude-a-dependency-for-a-configuration-but-not-for-an-inheriting-con

### Build with Java 7
```
export JAVA_HOME=/export/apps/jdk/JDK-1_7_0_21
```

### Print all dependencies (including transitive ones)
Make sure to execute this command from the project itself. See http://stackoverflow.com/questions/12288133/what-is-gradle-artifact-dependency-graph-command.
```
gradle dependencies
```

### Figure out whether you're depending on a jar
```
gradle dependencyInsight --configuration runtime --dependency azkaban
```
https://docs.gradle.org/current/userguide/tutorial_gradle_command_line.html#sec:dependency_insight

### Depend on latest version
Wildcard dependency. Use a `+`. See http://www.gradle.org/docs/current/userguide/dependency_management.html#sec:dependency_resolution.
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

### Set task execution order
```
taskA.mustRunAfter(taskB)
```
https://docs.gradle.org/current/userguide/more_about_tasks.html

### Fix "PermGen space" build error
See http://forums.gradle.org/gradle/topics/_system_out_java_lang_outofmemoryerror_permgen_space.
```
export JAVA_OPTS="-Xmx1024M -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512M"
```

### Specify internal repository
```
repositories {
  ivy {
    url "http://HOST:PORT/PATH/TO/REPO"
    layout "pattern", {
      artifact "[organisation]/[module]/[revision]/[artifact]-[revision](-[classifier]).[ext]"
      ivy "[organization]/[module]/[revision]/[module]-[revision].ivy"
      m2compatible = true
    }
  }
}
```

If you just use
```
repositories {
  maven {
    url "http://HOST:PORT/PATH/TO/REPO"
  }
}
```
transitive dependencies will not get resolved.

### Execute shell command with wildcard
```
def execResult = exec {
  commandLine "bash", "-c", "ls *.log"
}
```

### Disable all transitive dependencies.
```
configurations.all {
  transitive = false
}
```
http://stackoverflow.com/questions/17815864/gradle-how-to-disable-all-transitive-dependencies

### Exclude specific transitive dependency
```
compile('com.foo:foo:1.2.3') {
  exclude module: 'bar'
}
```
https://discuss.gradle.org/t/how-to-exclude-transitive-dependency/2119

### Unexpected repositories being used to resolve dependencies
There may be .gradle scripts in $GRADLE_HOME/init.d that are adding the respositories.

### Specify Ivy configuration
```
dependencies {
    runtime group: 'org.somegroup', name: 'somedependency', version: '1.0', configuration: 'someConfiguration'
}
```
https://docs.gradle.org/current/userguide/dependency_management.html#sec:dependency_configurations

### Extend from another configuration
```
configurations.B.extendsFrom(configurations.A)
```

### Clear extendsFrom
```
configurations.foo.extendsFrom = []
```

### Lazy Evaluation of Copy Configuration
```
from { fileTree("foo/bar").files } {
  into "."
}
```

### Offline Build
```
gradle build --offline
```

### Iterate over FileCollection
```
collection.each {File file ->
  println file.name
}
```
https://docs.gradle.org/current/userguide/working_with_files.html
