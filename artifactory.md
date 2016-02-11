### Download latest version of Artifactory
See https://www.jfrog.com/confluence/display/RTF/Artifactory+REST+API#ArtifactoryRESTAPI-RetrieveLatestArtifact.
```
GET http://localhost:8080/artifactory/ivy-local/org/acme/[RELEASE]/acme-[RELEASE].jar
```

### Folder-based view of Artifactory contents
http://HOST:PORT/artifactory/repo/com/foo/bar

### GAVC (GroupId, ArtifactId, Version, Classifier) Search
```
http://localhost:8080/artifactory/api/search/gavc?g=org.acme&v=1.2.3
```
https://www.jfrog.com/confluence/display/RTF/Artifactory+REST+API#ArtifactoryRESTAPI-GAVCSearch