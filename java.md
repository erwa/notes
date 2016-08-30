### Convert Array to List
```
Arrays.asList("intField", "stringField");
Arrays.asList(new Foo(), new Foo());
```


### Find jar that a class is in
* http://stackoverflow.com/questions/275120/java-how-do-i-know-which-jar-file-to-use-given-a-class-name
```
for f in `find . -name '*.jar'`;  do echo $f && jar tvf $f | grep -i CLASSNAME; done
```

* Also check out http://findjar.com

### Static Nested vs. Inner Classes
A nested class can be static or non-static. A non-static nested class is called an inner class. See http://stackoverflow.com/questions/70324/java-inner-class-and-static-nested-class.
```
OuterClass.StaticNestedClass nestedObject = new OuterClass.StaticNestedClass();

class OuterClass {
    ...
    class InnerClass {
        ...
    }
}
```
An inner class has direct access to methods and fields of enclosing class. An inner class must be instantiated through instance of outer class:
```
OuterClass.InnerClass innerObject = outerObject.new InnerClass();
```

### Accessibility Modifiers
https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html

Least restrictive -> Most restrictive:

* public
    * world
* protected
    * class + package + subclass
* no modifier (package private)
    * class + package
* private
    * class only

### Top-level class/interface accessibility modifiers
See http://stackoverflow.com/questions/6734849/why-cant-a-class-or-an-interface-receive-private-or-protected-access-modifiers. Top-level classes and interfaces can only have "public" or "package private" (default) accessibilities. Nested classes and interfaces can have private or protected modifiers

### Interface method modifiers
An interface's methods are always public and abstract. You can specify `public abstract`, but it is redundant and discouraged. See http://stackoverflow.com/questions/161633/should-methods-in-a-java-interface-be-declared-with-or-without-a-public-access-m.

### Interfaces with same method
Implementing two interfaces that both contain the same method is okay as long as both methods have the same signature. See http://stackoverflow.com/questions/2801878/implementing-two-interfaces-in-a-class-with-same-method-which-interface-method.

### An interface cannot extend an abstract class
See https://community.oracle.com/thread/2097080?start=0&tstart=0.

### Bitwise shift operators
```java
<< // unsigned left shift
>> // signed right shift (leftmost bits are filled in with sign bit)
// for negative numbers, this means leftmost bits are filled in with 1s
>>> // unsigned right shift (leftmost bits are filled in with 0s)
```

### Error when mixing Java 7 and Java 6 compiled jars
```
major version 51 is newer than 50, the highest major version supported by this compiler.
```

### Java major versions
http://stackoverflow.com/questions/9170832/list-of-java-class-file-format-major-version-numbers
* Java 1.2 uses major version 46
* Java 1.3 uses major version 47
* Java 1.4 uses major version 48
* Java 5 uses major version 49
* Java 6 uses major version 50

# Manipulating jars
### Extract one file from a jar
Specify the full path to a file inside jar:
```
jar xf JAR FILE
```

### Extract one file to stdout:
```
unzip -p foo.jar file
```

### Extract to a different directory
First, navigate to that directory and then do:
```
jar xf <path/to/jar>
```

### Delete/remove a file from a jar
```
zip -d JAR FILE
```

### Update a jar
First, recreate the file structure outside the jar. Then run:
```
jar uf JAR FILE
```

### Create a jar
```
jar cf JAR_NAME.jar file1 file2 dir1 file3 dir2 ...
```

### Java Decompiler
https://github.com/java-decompiler/jd-gui

http://jd.benow.ca/
* Build from source for Red Hat

### Decompile Java class
```
javap -c -private AvroGenericRecordReader
```

### Pipe output stream to a String
See http://stackoverflow.com/questions/216894/get-an-outputstream-into-a-string.
```
// Use ByteArrayOutputStream
baos.toString();
```

### System.nanoTime vs. System.currentTimeMillis
According to Effective Java, 2nd Ed., page 276, you should use `System.nanoTime` instead of `System.currentTimeMillis` for interval timing.

### Java data types
See http://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html.
* `float` is single-precision 32-bit IEEE 754 floating point
* `double` is double-precision 64-bit IEEE 754 floating point

### Initializing a multidimensional array
```
int[][][] threeDimArr = { { { 1, 2 }, { 3, 4 } }, { { 5, 6 }, { 7, 8 } } };
```

### Printing an array
```
import java.util.Arrays;
Arrays.toString(<array>);
```

### Common exceptions
See Effective Java, 2nd Ed., Item 60:
* `IllegalArgumentException` means non-null parameter value is inappropriate
* `IllegalStateException` means object state is inappropriate for method invocation
* `NullPointerException` means parameter value is null where prohibited

### Classpath wildcard behavior / jar loading order
See http://docs.oracle.com/javase/6/docs/technotes/tools/windows/classpath.html.
> The order in which the JAR files in a directory are enumerated in the expanded class path is not specified

### Xms and Xmx
The JVM is started with Xms memory and allowed to use up to Xmx memory

### Run a jar
```
java -jar foo.jar
```
The Main-Class must be defined in the jar's `META-INF/MANIFEST.MF` file.

### Array is not assignable to Iterable
See http://stackoverflow.com/questions/1160081/why-is-an-array-not-assignable-to-iterable.

### How to interpret a stack trace
See http://stackoverflow.com/questions/2945862/interpreting-java-lang-nosuchmethoderror-message and http://docs.oracle.com/javase/specs/jvms/se7/html/jvms-4.html#jvms-4.3. Also see http://stackoverflow.com/a/357386/1128392.
* `Lfoo.bar.ClassName;` means the type is foo.bar.ClassName
* `V` means void
* `B` means byte
* `[TYPE` means array of TYPE
* Return type follows closing parenthesis

### Set encoding of Java build and execution
See http://stackoverflow.com/questions/361975/setting-the-default-java-character-encoding.
```
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
java -Dfile.encoding=UTF-8 ... com.x.Main
```

### Typical Java JDK installation location on OSX
```
/Library/Java/JavaVirtualMachines
```

### Daemon thread
A daemon thread is one that does not prevent the JVM from exiting when the program finishes but the thread is still running. See http://stackoverflow.com/questions/2213340/what-is-daemon-thread-in-java.
```
setDaemon(true)
```

### Java has no notion of a subpackage
`foo.bar` and `foo.bar.baz` are completely separate packages. See http://stackoverflow.com/questions/1967229/java-subpackage-visiblity.

### Thread.sleep() and locks
`Thread.sleep()` does not cause the current thread to relinquish any currently held locks. See https://docs.oracle.com/javase/6/docs/api/java/lang/Thread.html#sleep(long).

### Monitor
See http://stackoverflow.com/a/3362473/1128392.
> A monitor is an entity that possesses both a lock and a wait set. In Java, any Object can serve as a monitor.

### Redirect stdout and stderr
```
System.setOut(PrintStream)
System.setErr(PrintStream)
```
Example: https://github.com/azkaban/azkaban-plugins/blob/master/plugins/reportal/src/azkaban/jobtype/ReportalPigRunner.java#L71

### `NoClassDefFoundError` != `ClassNotFoundException`
`NoClassDefFoundError` usually means ClassLoader ran into an error reading the class definition or in a static initializer. See http://stackoverflow.com/questions/7325579/java-lang-noclassdeffounderror-could-not-initialize-class-xxx.


### Class ClassLoader vs. thread context ClassLoader
http://stackoverflow.com/questions/1771679/difference-between-threads-context-class-loader-and-normal-classloader

Class classloader is the classloader originally used to load the class. Thread context classloader is the current thread's classloader. The two may be different if the class was created by one thread and then passed to another.
```
// class classloader
getClass().getClassLoader()

// thread context classloader
Thread.currentThread().getContextClassLoader()
```

### `java.io.tmpdir` not guaranteed to be affected by programmatic changes.
See http://docs.oracle.com/javase/8/docs/api/java/io/File.html#createTempFile-java.lang.String-java.lang.String-java.io.File-.
>  A different value may be given to this system property when the Java virtual machine is invoked, but programmatic changes to this property are not guaranteed to have any effect upon the temporary directory used by this method.

### Read entire file into string
```
String content = new Scanner(new File("filename")).useDelimiter("\\Z").next();
System.out.println(content);
```
See http://stackoverflow.com/questions/3402735/what-is-simplest-way-to-read-a-file-into-string.

### Add multiple attachments to mail
```
Multipart multipart = new MimeMultipart("mixed");
for (String str : attachment_PathList) {
    MimeBodyPart messageBodyPart = new MimeBodyPart();
    DataSource source = new FileDataSource(str);
    messageBodyPart.setDataHandler(new DataHandler(source));
    messageBodyPart.setFileName(source.getName());
    multipart.addBodyPart(messageBodyPart);
}
msg.setContent(multipart);
Transport.send(msg);
```
See http://stackoverflow.com/questions/8970455/java-mail-sending-multiple-attachments-not-working for details.

### Java String.matches()
Must match ENTIRE string. See http://stackoverflow.com/questions/8923398/regex-doesnt-work-in-string-matches for details.

### Read resource file from jar
```
InputStream in = T.class.getResourceAsStream( "/foo.txt" );
```
* http://stackoverflow.com/questions/20389255/reading-a-resource-file-from-within-jar
* http://stackoverflow.com/questions/2195445/eclipse-getresourceasstream-returning-null

### Get current working directory
```
System.out.println("Working Directory = " + System.getProperty("user.dir"));
```
http://stackoverflow.com/questions/4871051/getting-the-current-working-directory-in-java

# Javadoc

### `{@code MyClassName}`
https://blogs.oracle.com/darcy/entry/javadoc_tip_code_and_literal

### `{@link InputStream}`

# End Javadoc

### Write String to file
```
PrintWriter out = new PrintWriter("filename.txt");
out.println(text);
```
http://stackoverflow.com/questions/1053467/how-do-i-save-a-string-to-a-text-file-using-java

# Java 8 Features

### Functional interface
A functional interface is any interface that contains only one abstract method.
* https://docs.oracle.com/javase/8/docs/api/java/util/function/package-summary.html#package.description
* https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html#approach5

### Streams
```
int sum = widgets.stream()
                 .filter(w -> w.getColor() == RED)
                 .mapToInt(w -> w.getWeight())
                 .sum();
```
http://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html


### `java -cp` vs. `java -jar`
You cannot specify both.

http://stackoverflow.com/questions/11922681/differences-between-java-cp-and-java-jar


### `java` vs. `javax` packages
Historical thing. Not much difference now.
http://stackoverflow.com/questions/727844/javax-vs-java-package


### Java CLI Debugger (jdb)
```
jdb -attach localhost:8000

jdb -classpath *:`hadoop classpath` DelegationTokenTest

help

next

# Set breakpoint at beginning of method
stop in org.apache.hadoop.hive.ql.exec.FunctionRegistry.getFunctionNames

# Set breakpoint at line number
stop at org.apache.hadoop.hive.ql.exec.FunctionRegistry:485

stop in org.apache.hadoop.ipc.Client.getTimeout

stop in org.apache.hadoop.ipc.Client.getConnection

stop in org.apache.hadoop.ipc.Client$Connection.setupIOstreams

# Print stacktrace
where
```
http://docs.oracle.com/javase/8/docs/technotes/tools/windows/jdb.html