# m:classifier in <artifact> tag
# http://stackoverflow.com/questions/6942989/ivy-cant-download-because-pom-file-and-the-jar-file-name-arent-matching-patt
<ivy-module version="2.0" xmlns:m="http://ant.apache.org/ivy/maven">
<publications>
  <artifact name="foo" type="tar.gz" ext="tar.gz" conf="archives" m:classifier="defaultArtifact"/>
</publications>