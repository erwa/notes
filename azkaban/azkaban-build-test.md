### Build Azkaban Plugins
```
ant # build all plugins

# Build 1 plugin
cd plugins/PLUGIN_NAME
ant
```


### Build Azkaban
```
gradlew build -x test
```

### Import into IntelliJ
After running `gradlew build` to generate Restli sources, open root build.gradle in IntelliJ.

### Testing

```
# Build azkaban-soloserver
gradlew assembleSoloserverDist -x test

cd azkaban-soloserver/build/package

bin/azkaban-solo-start.sh

# Open http://localhost:8081 in your browser
```

Add test users to `conf/azkaban-users.xml`.