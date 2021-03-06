### Include line number in log4j appender

```
%L

log4j.appender.console.layout.ConversionPattern=%d{yy/MM/dd HH:mm:ss} %p %c{2}:%L: %m%n
```

Note that retrieving line number can be slow.

https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/PatternLayout.html


### NullPointerException

May be due to non-static Logger.


### Disable commons-logging

```
  static {
    System.setProperty("org.apache.commons.logging.Log",
        "org.apache.commons.logging.impl.NoOpLog");
  }
```

https://stackoverflow.com/questions/1436761/turn-off-apache-common-logging


### Change log level for slf4j log4j

```
org.apache.log4j.Logger logger4j = org.apache.log4j.Logger.getRootLogger();
logger4j.setLevel(org.apache.log4j.Level.toLevel("DEBUG"));
```

https://prateep.info/2015/12/12/dynamically-change-log-level-in-slf4j-log4j-with-standalone-java-class/


### log4j: Change log level for category

```
Logger.getLogger("CATEGORY_NAME").setLevel(Level.OFF)
```

Example: DataNucleus: http://www.datanucleus.org/products/accessplatform/logging.html#_logging_categories


### Bare bones logging example

```
import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;

public class TestJava {
  private static final Logger _LOG = Logger.getLogger(TestJava.class);

  public static void main(String[] args) throws Exception {
    ConsoleAppender console = new ConsoleAppender();
    console.setName("consoleAppender");
    console.activateOptions();
    console.setLayout(new PatternLayout());
    Logger.getRootLogger().addAppender(console);

    // Change global log level
    Logger.getRootLogger().setLevel(Level.INFO)

    _LOG.info("hi");
  }
}
```


### Hierarchy

A logger is an ancestor if name followed by dot is prefix of descendant logger name. Example: Logger "foo" is an ancestor of logger "foo.bar".

https://logging.apache.org/log4j/1.2/manual.html#Logger_hierarchy


### Layout

Layout customizes the format of the log message for a specific appender.


### Logger vs. Appender

Logger generates messages, appender sends messages somewhere (console, database, etc.)

http://stackoverflow.com/questions/23322602/log4j-config-different-logs-to-different-files


### Change logging level from command line:

```
-Dlog4j.configuration=file:/path/to/file
```

http://stackoverflow.com/questions/7126709/how-do-i-set-log4j-level-on-the-command-line


### Change logging level for package/class

```
log4j.logger.my.pkg=DEBUG

log4j.logger.my.pkg.ab.class1=debug
```

http://stackoverflow.com/questions/4527204/log4j-set-different-loglevel-for-different-packages-classes


### slf4j

slf4j provides a logging API and various bindings/adaptors for existing logging frameworks (such as log4j).

Builders of libraries can code against the slf4j API and then users of the library can provided their own implementation.

slf4j-log4j12.jar and log4j-over-slf4j.jar cannot both be on the classpath at the same time, or else you'll get an endless loop: log4j -> log4j-over-slf4j -> slf4j-api -> slf4j-logj12 -> log4j

* http://www.slf4j.org/codes.html#log4jDelegationLoop