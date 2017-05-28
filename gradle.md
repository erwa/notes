### Default Log Level

Is LIFECYCLE. Does NOT include INFO.

https://docs.gradle.org/current/userguide/logging.html


### Fail build
```
throw new GradleException('error occurred')
```
http://stackoverflow.com/questions/10312259/recommended-way-to-stop-a-gradle-build


### Get directories in build dir
```
def tree = project.buildDir
tree.list().each { println it }
```


### Extract tarball
```
task test << {
    // invokes Project.copy() method - see https://discuss.gradle.org/t/copying-file-filetree-to-multiple-directories/7443
    copy {
        from tarTree(resources.gzip('model.tar.gz'))
        into getProjectDir()
    }
}
```
http://stackoverflow.com/questions/13017121/unpacking-tar-gz-into-root-dir-with-gradle


### Run one test
```
// * used to match any package name
gradle test --tests *SomeTest.method
```
http://stackoverflow.com/questions/22505533/how-to-run-a-one-test-class-only-on-gradle


### Use local repo
```
# local ivy repo
repositories {
  ivy {
    url '/Users/ahsu/local-repo'
    layout 'pattern', {
      ivy '[organisation]/[module]/[revision]/[module]-[revision].ivy'
      artifact '[organisation]/[module]/[revision]/[artifact]-[revision](-[classifier]).[ext]'
      m2compatible = true
    }
  }
}
```
http://stackoverflow.com/questions/10219627/how-to-specify-a-relative-path-to-the-local-ivy-repo-in-gradle


### Dependency with classifier
```
compile 'group:module:version:classifier'
```
https://docs.gradle.org/current/userguide/dependency_management.html#sub:classifiers


### Show test results in console in real-time
```
# You will also see a lot more info related to other tasks.
gradle test -i  # -i == --info
```
http://stackoverflow.com/questions/3963708/gradle-how-to-display-test-results-in-the-console-in-real-time


### File dependencies
```
dependencies {
    runtime files('libs/a.jar', 'libs/b.jar')
    runtime fileTree(dir: 'libs', include: '*.jar')
}
```
https://docs.gradle.org/current/userguide/dependency_management.html#sub:file_dependencies


### compileOnly dependencies
Not inherited by test classpath.

https://gradle.org/blog/compile-only-dependencies/

There's also `testCompileOnly`.


### Classpath order
The `dependencies { }` section returns given set of dependencies in a fixed but arbitrary order.

https://discuss.gradle.org/t/how-do-i-control-the-order-of-compile-classpaths/5329/4

Add jar to beginning of classpath:
```
    def snakeYamlPath
    configurations.runtime.resolve().each {
      def jarPath = it.getAbsolutePath()
      if (jarPath.contains('snakeyaml')) {
        snakeYamlPath = jarPath
      }
    }
    classpath = files(snakeYamlPath) + sourceSets.main.runtimeClasspath
```

Ref: https://discuss.gradle.org/t/how-to-get-absolute-path-of-a-file-declared-in-dependencies/5463/3


### Print buildscript classpath
```
task printBuildScriptClasspath << {
  println project.buildscript.configurations.classpath.asPath
}
```
https://gist.github.com/xconnecting/4037220


### Buildscript variables
Define variables in `buildscript` block, will be accessible both inside and outside it.
```
buildscript {
   ext {
     androidPluginVersion = '0.8.+'
   }
   repositories {
      mavenCentral()
   }
   dependencies {
      classpath "com.android.tools.build:gradle:$androidPluginVersion"
   }
}
```
http://wtanaka.com/node/8111


### Build Phases
1) Initialization
2) Configuration
3) Execution

https://docs.gradle.org/current/userguide/build_lifecycle.html


### Figure out whether you're depending on a jar
```
gradle dependencyInsight --configuration default --dependency azkaban
```
https://docs.gradle.org/current/userguide/tutorial_gradle_command_line.html#sec:dependency_insight


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


### Print classpath
```
task printClasspath {
    doLast {
        configurations.compile.each { println it }
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


### See all jars in use
```
ligradle idea --debug 2>&1 | less
```


### Print all dependencies (including transitive ones)
Make sure to execute this command from the project itself. See http://stackoverflow.com/questions/12288133/what-is-gradle-artifact-dependency-graph-command.
```
gradle dependencies
```

### Compile from local file
```
compile files('../lib/foo.jar')
```

### Depend on latest version
Wildcard dependency. Use a `+`. See http://www.gradle.org/docs/current/userguide/dependency_management.html#sec:dependency_resolution.
```
compile 'junit:junit:4.8.+'
```

### See what dependencies a configuration has
```
gradle :SUB_PROJECT_NAME:dependencies --configuration default
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

### Multi-project Configuration Order
Top-down (root project, then subprojects), even when build is executed from subproject.
```
Also note that all projects are always configured, even when you start the build from a subproject. The default configuration order is top down, which is usually what is needed.
```
https://docs.gradle.org/current/userguide/multi_project_builds.html#sub:configuration_time_dependencies


### Repository layout

https://docs.gradle.org/current/userguide/dependency_management.html#sec:repositories

https://docs.gradle.org/current/dsl/org.gradle.api.artifacts.repositories.IvyArtifactRepository.html#org.gradle.api.artifacts.repositories.IvyArtifactRepository:layout(java.lang.String, groovy.lang.Closure)


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
  exclude module: 'cglib' //by artifact name
  exclude group: 'org.jmock' //by group
  exclude group: 'org.unwanted', module: 'iAmBuggy' //by both name and group
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


### Set temp dir
```
# Make sure the /path/to/new/dir exists
gradle build -Djava.io.tmpdir=/path/to/new/dir
```

### Print configuration dependencies
```
println "Printing compile configuration"
configurations.compile.resolve().each { println it }
```
https://discuss.gradle.org/t/sourcesets-main-compileclasspath-vs-configurations-compile/6782