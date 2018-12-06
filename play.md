### Test configuration

```
val application: Application = new GuiceApplicationBuilder()
  .configure("some.configuration" -> "value")
  .build()
```

https://www.playframework.com/documentation/2.6.x/ScalaFunctionalTestingWithScalaTest#Creating-Application-instances-for-testing


### Play configuration

* application.conf
* override with system properties (`-Dfoo=123`)
* read config from environment: `my.key = ${?MY_KEY_ENV}`

https://www.playframework.com/documentation/2.6.x/ProductionConfiguration


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