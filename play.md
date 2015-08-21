### Java vs. Scala
Package names:
* If the package is play.api.XXX, it's for Scala clients
* If the package is play.XXX, it's for Java clients

### Logging
https://www.playframework.com/documentation/2.3.x/ScalaLogging

```
import play.api.Logger

Logger.info("TEST LOGGING")
```

### Include local jar
https://www.playframework.com/documentation/1.2/dependency
* Put it in the `lib/` folder
* Need to restart application