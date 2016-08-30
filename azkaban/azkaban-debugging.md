### Enable DEBUG logging

In bin/azkaban-executor-start.sh, add to AZKABAN_OPTS
```
-Dlog4j.configuration=file:/path/to/custom/log4j.properties
```

Default log4j.properties is in lib/azkaban-execserver-3.0.0.jar