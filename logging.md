# log4j

### Change logging level from command line:
```
-Dlog4j.configuration=file:/path/to/file
```
http://stackoverflow.com/questions/7126709/how-do-i-set-log4j-level-on-the-command-line

### Change logging level for package
```
log4j.logger.my.pkg=DEBUG
```


# slf4j

slf4j provides a logging API and various bindings/adaptors for existing logging frameworks (such as log4j).

Builders of libraries can code against the slf4j API and then users of the library can provided their own implementation.

slf4j-log4j12.jar and log4j-over-slf4j.jar cannot both be on the classpath at the same time, or else you'll get an endless loop: log4j -> log4j-over-slf4j -> slf4j-api -> slf4j-logj12 -> log4j
* http://www.slf4j.org/codes.html#log4jDelegationLoop