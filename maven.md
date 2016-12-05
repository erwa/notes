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