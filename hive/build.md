### Generating tarball
Works for trunk
```
# Takes about 6 minutes
# Include "clean" to be safe
# Add "install" if you want to install in local Maven repo
mvn package -DskipTests -Pdist

# Output in packaging/target directory
```
https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-Howtogeneratetarball?

### Building all source
Works for trunk.
```
# Takes about 4 minutes
# Add "clean" to be safe (or if the build fails the first time you try)
mvn install -DskipTests

cd itests

# Takes about 2 minutes
# Add "clean" to be safe
mvn install -DskipTests
```
https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-Howtobuildallsource?

### Running all tests
```
mvn test
cd itests
mvn test

# You can also run tests for just one component by cd'ing to that component directory first
cd metastore
mvn test
```
https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-HowdoIrunalloftheunittests?

### Run a single test
```
mvn test -Dtest=ClassName
```
https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-HowdoIrunasingletest?