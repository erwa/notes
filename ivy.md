### Local repo
```
      <filesystem name="local-repo" m2compatible="true">
        <ivy pattern="${user.home}/local-repo/[organization]/[module]/[revision]/[module]-[revision].ivy"/>
        <artifact pattern="${user.home}/local-repo/[organization]/[module]/[revision]/[module]-[revision](-[classifier]).[ext]"/>
      </filesystem>
```


### Resolving Maven / POM Artifacts

https://stackoverflow.com/questions/7104364/how-are-maven-scopes-mapped-to-ivy-configurations-by-ivy


### Use custom ivysettings.xml file
```
<project xmlns:ivy="antlib:org.apache.ivy.ant" name="ant test" default="run">
  <target name="configure-ivy">
    <ivy:configure file="ivysettings.xml" id="convertSettings"/>
  </target>
  <target name="resolve" description="--> retrieve dependencies with ivy" depends="configure-ivy">
    <ivy:retrieve/>
  </target>
</project>
```


### Test artifact resolution
http://ant.apache.org/ivy/history/latest-milestone/tutorial/start.html

ivy.xml file:
```
<ivy-module version="2.0">
    <info organisation="org.apache" module="hello-ivy"/>
    <dependencies>
        <dependency org="commons-lang" name="commons-lang" rev="2.0"/>
    </dependencies>
</ivy-module>
```

build.xml file:
```
<project xmlns:ivy="antlib:org.apache.ivy.ant" name="ant test" default="run">
  <target name="resolve" description="--> retrieve dependencies with ivy">
    <ivy:retrieve />
  </target>
</project>
```

Run
```
# /path/to/lib contains ivy-2.3.0.jar
ant -lib /path/to/lib resolve
```


### Fallback configuration
```
test->runtime(default)
# means the test configuration of the master module requires the runtime configuration of the dependency module, and if the runtime configuration does not exist, use the default configuration

test->runtime(*)
# fallback to any configuration
```
http://ant.apache.org/ivy/history/2.1.0/ivyfile/dependency.html


### m:classifier in <artifact> tag
http://stackoverflow.com/questions/6942989/ivy-cant-download-because-pom-file-and-the-jar-file-name-arent-matching-patt
```
<ivy-module version="2.0" xmlns:m="http://ant.apache.org/ivy/maven">
<publications>
  <artifact name="foo" type="tar.gz" ext="tar.gz" conf="archives" m:classifier="defaultArtifact"/>
</publications>
```