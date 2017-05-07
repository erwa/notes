### Child POM inheritance of parent plugins
* Plugins declared outside `<pluginManagement>` are inherited by child POMs by default.
* Plugins declared within `<pluginManagement>` configure global settings inherited by all child POMs that explicitly depend on those plugins.
```
<build>
  <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-scm-plugin</artifactId>
      <version>1.0</version>
      <configuration>
        <...>
      </configuration>
      <executions>
        <...>
      </executions>
    </plugin>
  </plugins>
</build>
```
http://stackoverflow.com/questions/9477789/maven-parent-pom-child-inheritance


### Exclude all transitive dependencies
```
<dependency>
    <groupId>${project.groupId}</groupId>
    <artifactId>app</artifactId>
    <version>${project.version}</version>
    <exclusions>
        <exclusion>
            <groupId>*</groupId>
            <artifactId>*</artifactId>
        </exclusion>
    </exclusions>
</dependency>
```
http://stackoverflow.com/questions/547805/exclude-all-transitive-dependencies-of-a-single-dependency/7556707#7556707


### Build Lifecycle
3 built-in lifecycles:
* default
* clean
* site

A lifecycle is made up of an ordered sequence of phases, like validate, compile, test, package, verify, install, deploy.

A phase is made up of plugin goals.

Executing a phase will run all the phases in the corresponding lifecycle up to and including the specified phase. Ref: https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html#Build_the_Project

A full list of all the phases (in order) in the built-in lifecycles can be found at https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#Lifecycle_Reference.


### Parallel Builds
```
-T 1C  # build with 1 thread per CPU core
-T 4   # build with 4 threads
```
https://cwiki.apache.org/confluence/display/MAVEN/Parallel+builds+in+Maven+3


### Build specific submodules
```
# only build B submodule and the submodules it depends on
mvn install -pl B -am
```

```
-pl, --projects
        Build specified reactor projects instead of all projects
-am, --also-make
        If project list is specified, also build projects required by the list
```
http://stackoverflow.com/questions/1114026/maven-modules-building-a-single-specific-module


### Profile activation
Profile is automatically activated if JDK version starts with 1.4
```
<profiles>
  <profile>
    <activation>
      <jdk>1.4</jdk>
    </activation>
    ...
  </profile>
</profiles>
```
http://maven.apache.org/guides/introduction/introduction-to-profiles.html#Details_on_profile_activation


### Setting plugin parameters

http://stackoverflow.com/questions/23391502/whats-the-meaning-of-user-property-of-maven-plugin-parameter


### Disable sources jar
```
-Dsource.skip=true

# sometimes also works
-Dmaven.source.skip=true

# should see log message
[INFO] Skipping source per configuration.
```
http://maven.apache.org/plugins/maven-source-plugin/jar-mojo.html#skipSource


### Scala Maven Plugin
Disable scaladoc
```
-Dskip=true

# should see
[INFO] Skipping javadoc generation
```
http://davidb.github.io/scala-maven-plugin/doc-jar-mojo.html#skip


### Javadoc plugin
pom.xml
```
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-javadoc-plugin</artifactId>
        <version>2.10.3</version>
      </plugin>
    </plugins>
  </build>
```

```
mvn javadoc:jar
```
https://maven.apache.org/plugins/maven-javadoc-plugin/usage.html#Generate_Standalone_Javadocs


### Disable javadoc
```
-Dmaven.javadoc.skip=true

# should see log message
[INFO] Skipping javadoc generation
```
http://stackoverflow.com/questions/7412016/how-can-i-disable-the-maven-javadoc-plugin-from-the-command-line


### Offline mode
Add `-o` flag.


### Find unused dependencies
```
mvn dependency:analyze
```
http://stackoverflow.com/questions/1517611/is-there-a-simple-way-to-remove-unused-dependencies-from-a-maven-pom-xml


### Override Maven properties from command line
Define property, then reference property in configuration. Use `-DpropName=propValue` on command line to override default value.

http://stackoverflow.com/questions/13876165/how-to-override-maven-property-in-command-line

If property is hardcoded in `<configuration>` block, no general way of overriding:
* http://stackoverflow.com/questions/4660047/override-maven-plugin-configuration-defined-in-the-pom-pluginmanagement-from-the
* http://stackoverflow.com/questions/35048422/override-maven-plugin-parameters
* http://stackoverflow.com/questions/13708738/how-to-get-a-command-line-property-to-overwrite-a-maven-property


### Assertions
Maven Surefire Plugin enables assertions by default for tests.

http://maven.apache.org/surefire/maven-surefire-plugin/test-mojo.html#enableAssertions

http://stackoverflow.com/questions/19966620/enable-assert-in-a-maven-built-project


### Listing goals/targets
You cannot list all goals/targets in Maven, like you can in Ant

http://stackoverflow.com/questions/3996802/list-all-of-the-possible-goals-in-maven-2

### Multiple scopes

You can only define one scope per `<scope/>` tag.

http://stackoverflow.com/questions/14601607/correct-way-to-declare-multiple-scope-for-maven-dependency

### Test jar

To specify the test jar for a dependency, use
```
<type>test-jar</type>
```
https://groups.google.com/a/cloudera.org/forum/#!topic/cdh-user/p0FKZqoaiQ8

### Maven Shade Plugin

http://maven.apache.org/plugins/maven-shade-plugin/
* Allows you to rename package names (shade them)
* Example: rename `org.codehaus.plexus.util` to `org.shaded.plexus.util`

### Resume build
```
-rf myproject-commons
```
https://dzone.com/articles/5-maven-tips

### Dependent Modules
Maven will NOT automatically build dependent modules, but just use the latest good version in the repository

http://stackoverflow.com/questions/808516/maven-and-dependent-modules