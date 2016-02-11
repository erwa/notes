### Generating tarball
Works for trunk
```
# Takes about 6 minutes
# Omit clean to make it run faster
mvn clean package -DskipTests -Pdist

# Output in packaging/target directory
```
https://cwiki.apache.org/confluence/display/Hive/HiveDeveloperFAQ#HiveDeveloperFAQ-Howtogeneratetarball?

### Building all source
Works for trunk.
```
# Takes about 4 minutes
mvn clean install -DskipTests

cd itests

# Takes about 2 minutes
mvn clean install -DskipTests
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