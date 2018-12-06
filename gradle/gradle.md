### Print task dependency graph

```
# prints tasks in order they will be run
gradle assemble --dry-run ...
```

https://stackoverflow.com/questions/10422054/is-there-a-way-to-list-task-dependencies-in-gradle


### Show task usage

```
gradle help --task :my:task
```


### Remove artifact from configurations

```
jar.enabled = false
configurations.all {
  artifacts.removeAll artifacts.findAll { !it.archiveTask.enabled }
}
```

https://discuss.gradle.org/t/should-disabling-a-task-automatically-remove-any-artifact-it-might-publish/2354


### Automatically enable annotation preprocessing

Useful if you're using Lombok

```
// Automatically configure IDEA to enable annotation preprocessing
// Ref: http://mrhaki.blogspot.com/2016/03/gradle-goodness-enable-compiler.html
idea.project.ipr.withXml { provider ->
  // Get XML as groovy.util.Node to work with.
  def projectXml = provider.asNode()

  // Find compiler configuration component.
  def compilerConfiguration = projectXml.component.find {
    component -> component.'@name' == 'CompilerConfiguration'
  }

  // Replace current annotationProcessing
  // that is part of the compiler configuration.
  def currentAnnotationProcessing = compilerConfiguration.annotationProcessing
  currentAnnotationProcessing.replaceNode {
    annotationProcessing {
      profile(name: 'Default', default: true, enabled: true) {
        processorPath(useClasspath: true)
      }
    }
  }
}
```


### Print task dependency graph

```
gradle <task> --dry-run

# prints tasks in execution order
```

https://stackoverflow.com/a/43512599/1128392


### Get jar location of another module programmatically

```
task foo(dependsOn: ':another:jar') << {
  print project(':another').jar.outputs.files.singleFile
}
```


### Get single file in collection

```
// Asserts collection contains exactly 1 file
fileCollection.singleFile
```

https://docs.gradle.org/current/javadoc/org/gradle/api/file/FileCollection.html#getSingleFile--
https://docs.gradle.org/current/userguide/working_with_files.html#sec:file_collections


### Recursive projects

You can only have one `settings.gradle` file.

https://stackoverflow.com/questions/18676734/gradle-recursive-subprojects


### Find unused dependencies

https://github.com/nebula-plugins/gradle-lint-plugin
https://stackoverflow.com/a/37583197/1128392

```
# in root build.gradle
buildscript {
  dependencies {
    classpath 'com.netflix.nebula:gradle-lint-plugin:latest.release'
  }

  repositories { jcenter() }
}

allprojects {
  apply plugin: 'nebula.lint'
  gradleLint.rules = ['unused-dependency']
}
```

Then run

```
gradle lintGradle
```


### Increase heap space for Gradle

```
# set in root gradle.properties file
org.gradle.jvmargs=-XX\:MaxHeapSize\=2048m -Xmx2048m
```


### Set test system property

```
test {
  // pass in on command line using -Darg1=foo
  systemProperty 'arg1', System.getProperty('arg1')
  systemProperty "propertyName", "propertyValue"
  systemProperty "cassandra.ip", project.getProperty("cassandra.ip")

  // pass all system properties
  systemProperties(System.getProperties())
}
```

https://stackoverflow.com/questions/42492742/how-to-pass-command-line-arguments-to-tests-with-gradle-test
https://stackoverflow.com/questions/21406265/how-to-give-system-property-to-my-test-via-gradle-and-d


### Task Outcomes

https://docs.gradle.org/current/userguide/more_about_tasks.html#sec:task_outcomes


### Disable up-to-date check

```
test.outputs.upToDateWhen {false}
```

https://stackoverflow.com/questions/29427020/how-to-run-gradle-test-when-all-tests-are-up-to-date

https://docs.gradle.org/current/userguide/more_about_tasks.html#sec:how_does_it_work

https://docs.gradle.org/current/userguide/more_about_tasks.html explains UP-TO-DATE, FROM-CACHE, SKIPPED, etc.


### Force run tasks

```
--rerun-tasks
```

https://stackoverflow.com/questions/42175235/force-gradle-to-run-task-even-if-it-is-up-to-date


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


### Project directory

```
projectDir
```

https://docs.gradle.org/current/dsl/org.gradle.api.Project.html#org.gradle.api.Project:projectDir


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


### Testing framework

```
test {
  // default is JUnit
  useTestNG()
}
```

https://docs.gradle.org/current/dsl/org.gradle.api.tasks.testing.Test.html


### Run one test / run one unit test / run 1 unit test

```
./gradlew :gobblin-data-management:test --tests *AvroSchemaManagerTest

// * used to match any package name
gradle test --tests *SomeTest.method
```

http://stackoverflow.com/questions/22505533/how-to-run-a-one-test-class-only-on-gradle


### Use local repo

Note that the order of the repositories listed matters. Gradle checks them in order.

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


### Add directory to classpath

Copy files to `src/main/resources`.

https://stackoverflow.com/questions/35545405/gradle-add-directory-to-classpath


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


### Local variable

```
def foo = 123
```

https://docs.gradle.org/current/userguide/writing_build_scripts.html#sec:declaring_variables


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

Tasks may be defined at the end of the Configuration phase: https://stackoverflow.com/a/44325473/1128392


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


### Unset environment variable

```
environment.remove('HIVE_CONF_DIR')
```

https://discuss.gradle.org/t/unset-environment-variable-in-an-exec-task/25519


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


### Apply to subproject if it applies a plugin

```
subprojects {
    plugins.withType(JavaPlugin) {
        ...
    }
    plugins.withType(WarPlugin) {
        ...
    }
}
```

https://discuss.gradle.org/t/how-do-i-detect-if-a-sub-project-has-applied-a-given-plugin-e-g-jar-or-war/4974


### Test class dependencies / depend on test classes in another subproject

```
dependencies {
  testCompile project(':A').sourceSets.test.output
}
```

https://stackoverflow.com/questions/5644011/multi-project-test-dependencies-with-gradle


### Dependency Configuration / Depend on specific configuration

By default, when you depend on a module, you depend on its "default" configuration. To specify configuration:

```
dependencies {
    runtime group: 'org.somegroup', name: 'somedependency', version: '1.0', configuration: 'someConfiguration'
    compile project(path: ':other-project', configuration: 'compile')

    runtime group: 'org.springframework', name: 'spring-core', version: '2.5'
    runtime 'org.springframework:spring-core:2.5',
            'org.springframework:spring-aop:2.5'
    runtime(
        [group: 'org.springframework', name: 'spring-core', version: '2.5'],
        [group: 'org.springframework', name: 'spring-aop', version: '2.5']
    )
    runtime('org.hibernate:hibernate:3.0.5') {
        transitive = true
    }
    runtime group: 'org.hibernate', name: 'hibernate', version: '3.0.5', transitive: true
    runtime(group: 'org.hibernate', name: 'hibernate', version: '3.0.5') {
        transitive = true
    }
}
```

https://docs.gradle.org/current/userguide/dependency_types.html

https://docs.gradle.org/current/dsl/org.gradle.api.artifacts.dsl.DependencyHandler.html

https://docs.gradle.org/3.3/userguide/dependency_management.html#sec:dependency_configurations


### Exclude dependency from configuration

```
configurations.all*.exclude group: 'com.foo'
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


### Make one task depend on another

```
task taskX(dependsOn: ':projectB:taskY') {
```

https://docs.gradle.org/current/userguide/more_about_tasks.html#sec:adding_dependencies_to_tasks


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


### `subprojects` block

Is recursive, not just direct children.


### Change configuration execution order

```
evaluationDependsOn(':producer')
```

https://docs.gradle.org/current/userguide/multi_project_builds.html#sub:configuration_time_dependencies


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


### Specify Ivy

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


### Set temp dir, /tmp quota exceeded issues

```
# Make sure the /path/to/new/dir exists
gradle build -Djava.io.tmpdir=/path/to/new/dir
```

https://stackoverflow.com/questions/44648664/move-gradle-temporary-cache-dir-to-other-directory


### Print configuration dependencies

```
println "Printing compile configuration"
configurations.compile.resolve().each { println it }
```

https://discuss.gradle.org/t/sourcesets-main-compileclasspath-vs-configurations-compile/6782