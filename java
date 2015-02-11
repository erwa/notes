/* Static Nested vs. Inner Classes */
// Nested Class can be static or non-static
// non-static nested class is called an inner class
// http://stackoverflow.com/questions/70324/java-inner-class-and-static-nested-class
OuterClass.StaticNestedClass nestedObject = new OuterClass.StaticNestedClass();

class OuterClass {
    ...
    class InnerClass {
        ...
    }
}

// inner class has direct access to methods and fields of enclosing class
// inner class must be instantiated through instance of outer class
OuterClass.InnerClass innerObject = outerObject.new InnerClass();

/* Top-level class/interface accessibility modifiers */
// http://stackoverflow.com/questions/6734849/why-cant-a-class-or-an-interface-receive-private-or-protected-access-modifiers
// Top-level classes and interfaces can only have "public" or "package private" (default) accessibilities
// Nested classes and interfaces can have private or protected modifiers

/* Interface method modifiers */
// An interface's methods are always public and abstract
// You can specify "public abstract", but it is redundant and discouraged
// http://stackoverflow.com/questions/161633/should-methods-in-a-java-interface-be-declared-with-or-without-a-public-access-m

// Implementing two interfaces that both contain the same method is okay as long as both methods have the same signature
// http://stackoverflow.com/questions/2801878/implementing-two-interfaces-in-a-class-with-same-method-which-interface-method

// An interface cannot extend an abstract class
// https://community.oracle.com/thread/2097080?start=0&tstart=0

/* Bitwise shift operators */
<< // unsigned left shift
>> // signed right shift (leftmost bits are filled in with sign bit)
// for negative numbers, this means leftmost bits are filled in with 1s
>>> // unsigned right shift (leftmost bits are filled in with 0s)

/* mix of Java 7 and Java 6 compiled jars */
major version 51 is newer than 50, the highest major version supported by this compiler.

# extract one file from a jar
# specify full path to file inside jar
jar xf JAR FILE

# extract one file to stdout
unzip -p foo.jar file

# To extract to a different directory, navigate to that directory and then do
jar xf <path/to/jar>

# delete a file from a jar
zip -d JAR FILE

# add file to jar
# update a file in a jar
# you have to recreate the file structure outside the jar first
jar uf JAR FILE

# create a jar
jar cf JAR_NAME.jar file1 file2 dir1 file3 dir2 ...

# Decompile Java class
javap -c -private AvroGenericRecordReader

# Find jar that a class is in
# http://stackoverflow.com/questions/275120/java-how-do-i-know-which-jar-file-to-use-given-a-class-name
for f in `find . -name '*.jar'`;  do echo $f && jar tvf $f | grep -i CLASSNAME; done

// Pipe output stream to a String
// http://stackoverflow.com/questions/216894/get-an-outputstream-into-a-string
// Use ByteArrayOutputStream
baos.toString();

// According to Effective Java, 2nd Ed., page 276, you should use System.nanoTime instead of System.currentTimeMillis for interval timing.

// Java data types
// http://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html
float // single-precision 32-bit IEEE 754 floating point
double // double-precision 64-bit IEEE 754 floating point

// Initializing a multidimensional array
int[][][] threeDimArr = { { { 1, 2 }, { 3, 4 } }, { { 5, 6 }, { 7, 8 } } };

// Print array
import java.util.Arrays;
Arrays.toString(<array>);

// Common exceptions
// Effective Java, 2nd Ed., Item 60
IllegalArgumentException // Non-null parameter value is inappropriate
IllegalStateException // Object state is inappropriate for method invocation
NullPointerException // Parameter value is null where prohibited

// Classpath wildcard behavior
// http://docs.oracle.com/javase/6/docs/technotes/tools/windows/classpath.html

// Xms and Xmx
// JVM is started with Xms memory and allowed to use up to Xmx memory

// To run a jar
java -jar foo.jar
// The Main-Class must be defined in the jar's META-INF/MANIFEST.MF

// Array is not assignable to Iterable
// http://stackoverflow.com/questions/1160081/why-is-an-array-not-assignable-to-iterable

// How to interpret a stack trace
// http://stackoverflow.com/questions/2945862/interpreting-java-lang-nosuchmethoderror-message
// http://docs.oracle.com/javase/specs/jvms/se7/html/jvms-4.html#jvms-4.3
// V means void

# Set encoding of Java build and execution
# http://stackoverflow.com/questions/361975/setting-the-default-java-character-encoding
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
java -Dfile.encoding=UTF-8 ... com.x.Main

// Typical Java JDK installation location on OSX
/Library/Java/JavaVirtualMachines

// A daemon thread is one that does not prevent the JVM from exiting
// when the program finishes but the thread is still running
// http://stackoverflow.com/questions/2213340/what-is-daemon-thread-in-java
setDaemon(true)

// Java has no notion of a subpackage
// `foo.bar` and `foo.bar.baz` are completely separate packages
// http://stackoverflow.com/questions/1967229/java-subpackage-visiblity

// Thread.sleep() does not cause the current thread to relinquish any
// currently held locks
// https://docs.oracle.com/javase/6/docs/api/java/lang/Thread.html#sleep(long)

// "A monitor is an entity that possesses both a lock and a wait set.
// In Java, any Object can serve as a monitor."
// http://stackoverflow.com/a/3362473/1128392

// Redirect stdout and stderr
System.setOut(PrintStream)
System.setErr(PrintStream)
// Example: https://github.com/azkaban/azkaban-plugins/blob/master/plugins/reportal/src/azkaban/jobtype/ReportalPigRunner.java#L71

// Jar loading order within a directory lib/* is not guaranteed
// http://docs.oracle.com/javase/8/docs/technotes/tools/unix/classpath.html#A1100762
// "The order in which the JAR files in a directory are enumerated in the expanded class path is not specified and may vary from platform to platform and even from moment to moment on the same machine. A well-constructed application should not depend upon any particular order. If a specific order is required, then the JAR files can be enumerated explicitly in the class path."

// NoClassDefFoundError != ClassNotFoundException
// NoClassDefFoundError usually means ClassLoader ran into an error reading the class definition or in a static initializer
// http://stackoverflow.com/questions/7325579/java-lang-noclassdeffounderror-could-not-initialize-class-xxx