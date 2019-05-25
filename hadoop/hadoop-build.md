### Build one module and its dependencies

```
mvn install -pl hadoop-mapreduce-project -am -DskipTests -Dmaven.javadoc.skip=true
```

See [maven.md](../maven.md) for info about `-pl` and `-am`.


### Building trunk

Last tested with 3.2.0-SNAPSHOT.

```
mvn install -Pdist -DskipTests -Dtar -Dmaven.javadoc.skip=true
```


### POM dependency versions

Versions of dependencies are defined in `hadoop-project/pom.xml`.