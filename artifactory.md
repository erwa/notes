### Default Virtual Repository

Virtual repository is an aggregation of local and remote (physical) repositories.

Default virtual repository is /repo.

https://www.jfrog.com/confluence/display/RTF/Configuring+Repositories#ConfiguringRepositories-TheDefaultVirtualRepository(Deprecated)


### Get latest version

http://host:port/artifactory/api/search/latestVersion?g=com.example.foo&a=foo&v=*


### Download latest version of Artifactory

See https://www.jfrog.com/confluence/display/RTF/Artifactory+REST+API#ArtifactoryRESTAPI-RetrieveLatestArtifact.

```
GET http://localhost:8080/artifactory/ivy-local/org/acme/[RELEASE]/acme-[RELEASE].jar
```

### Folder-based view of Artifactory contents

http://HOST:PORT/artifactory/repo/com/foo/bar


### GAVC (GroupId, ArtifactId, Version, Classifier) Search

Example: http://localhost:8080/artifactory/api/search/gavc?g=org.acme&v=1.2.3

https://www.jfrog.com/confluence/display/RTF/Artifactory+REST+API#ArtifactoryRESTAPI-GAVCSearch