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