### Optional

```
Optional<String> s = Optional.of("foo");

// when String is needed
s.orElse("");

s.isPresent()
s.isEmpty()

// returns Optional<T> where T is return type of transform()
s.map(thing -> transform(thing))
```


### Remove leading and trailing whitespace / strip / trim

```
s.trim();
```


### HTTP GET request

```
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

    // one instance, reuse
    private final HttpClient httpClient = HttpClient.newBuilder()
            .version(HttpClient.Version.HTTP_2)
            .build();

        HttpRequest request = HttpRequest.newBuilder()
                .GET()
                .uri(URI.create("https://httpbin.org/get"))
                .setHeader("User-Agent", "Java 11 HttpClient Bot")
                .build();

        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

        // print status code
        System.out.println(response.statusCode());

        // print response body
        System.out.println(response.body());
```

https://mkyong.com/java/how-to-send-http-request-getpost-in-java/


### Double.MIN_VALUE

`Double.MIN_VALUE` is positive! Use `-Double.MAX_VALUE` for the least Double value.

https://stackoverflow.com/questions/3884793/why-is-double-min-value-in-not-negative


### Comparator for sorting | inline comparator | lambda comparator

```
Collections.sort(termScores, Comparator.comparingDouble(ts -> ts.score));

private static Map<Pair,Integer> tracedInputs = new TreeMap<>(
    (Pair p1, Pair p2) -> {
      if (p1.tx != p2.tx) {
        return p1.tx - p2.tx;
      }
      return p1.idx - p2.idx;
    });
```

https://mkyong.com/java8/java-8-lambda-comparator-example/


### Flat map

Function is applied to each element and returns a stream. Flat map takes care of merging all streams together.

https://www.geeksforgeeks.org/stream-flatmap-java-examples/


### Java Persistence API (JPA)

An approach to ORM (object-relational mapping) in Java.

https://www.vogella.com/tutorials/JavaPersistenceAPI/article.html


### Find jar that a class is in

```
for f in `find . -name '*.jar'`;  do echo $f && jar tvf $f | grep -i CLASSNAME; done
```

http://stackoverflow.com/questions/275120/java-how-do-i-know-which-jar-file-to-use-given-a-class-name

Also check out http://findjar.com


### Heap dump

Make sure you run the command as the same user who owns the process!

```
# 1234 is PID
# Have had cases where -heap failed ("sun.jvm.hotspot.debugger.DebuggerException: cannot open binary file") but -histo worked
jmap -heap 1234 > process.jmap.heap.usage

# or -histo:live
# Won't work if JVM started with -XX:+DisableAttachMechanism
jmap -histo 1234 > process.jmap.histo

# more in-depth info, but will significantly slow down process
jmap -dump:live,format=b,file=process.jmap.bin 4363

# -F will DRAMATICALLY SLOW THINGS down
# https://stackoverflow.com/questions/26140182/running-jmap-getting-unable-to-open-socket-file
```


### Condition variables

`Condition` variables are intrinsically associated with a lock, so when `.await()` is called on the `Condition` variable, the lock gets released.

https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/locks/Condition.html


### Thread vs. Runnable

Runnable is "purer" - implement an interface (can use composition) vs. extending a class. You usually just want to run sommething rather than customize a thread's behavior.

https://stackoverflow.com/questions/541487/implements-runnable-vs-extends-thread-in-java


### Interrupting threads

Threads must cooperate. One thread calls `Thread.interrupt()`. The other must check the interrupted status via `Thread.interrupted()`.

https://stackoverflow.com/questions/3590000/what-does-java-lang-thread-interrupt-do


### Anonymous class with constructor argument

```
public class Hello {

  protected String s;

  public Hello(String str){
    this.s = str;
  }
  public void sayHello(){
    System.out.println(s);
  };

  void foo(){};
}

  public static void main(String[] args) {

    //anonymous class inside method
    Hello h = new Hello("abc") {

      @Override
      public void sayHello() {
        System.out.println("Hello anonymous class "+s);
      }
    };

    h.sayHello();

  }
```

https://www.journaldev.com/12534/java-anonymous-class#java-anonymous-class-example-with-constructor-argument


### Switch-case indentation

```
switch (i){
case 0:
    break;
case 1:
    break;
}
```

Argument is `case`s are logical labels, so should be unindented from the code.

https://stackoverflow.com/questions/4509039/why-the-strange-indentation-on-switch-statements


### Iterate over stream with indices

```
String[] names = {"Sam", "Pamela", "Dave", "Pascal", "Erik"};
IntStream.range(0, names.length)
         .filter(i -> names[i].length() <= i)
         .mapToObj(i -> names[i])
         .collect(Collectors.toList());
```

https://stackoverflow.com/questions/18552005/is-there-a-concise-way-to-iterate-over-a-stream-with-indices-in-java-8


### Initialize or update Map

Use `compute`.

```
map.compute(key, (k, v) -> (v == null) ? msg : v.concat(msg))
```

https://docs.oracle.com/javase/8/docs/api/java/util/Map.html#compute-K-java.util.function.BiFunction-


### Transform `Map`

```
Map<String, Column> copy = original.entrySet()
    .stream()
    .collect(Collectors.toMap(Map.Entry::getKey,
                              e -> new Column(e.getValue())));
```

https://stackoverflow.com/questions/22742974/in-java-8-how-do-i-transform-a-mapk-v-to-another-mapk-v-using-a-lambda


### Wilcard generic

`?` by itself means any class extending `Object`.

https://stackoverflow.com/questions/3009745/what-does-the-question-mark-in-java-generics-type-parameter-mean

`?` is different from `Object` and is important for enforcing type constraints.

https://stackoverflow.com/a/1840022/1128392


### Double-brace initialization

```
// Avoid
Map map = new HashMap() {{ put("John", "Doe"); }};
```

https://stackoverflow.com/a/27521360/1128392


### Throw exception from lambda

If lambda does not throw the exception, need to catch and wrap in an exception it does throw or an unchecked exception

```
Function<String, Integer> f =
    (String t) -> {
        try {
           return myMethod(t);
        }
        catch(IOException e) {
            throw new UncheckedIOException(e);
        }
    };
```

https://stackoverflow.com/questions/18198176/java-8-lambda-function-that-throws-exception


### Lambda incompatible thrown types

```
java: incompatible thrown types <Exception> in method reference
```

Because `Consumer<T>` interface's `accept()` method does not declare any exceptions.

https://stackoverflow.com/questions/25643348/java-8-method-reference-unhandled-exception


### Get all constructors (including private ones) / Get private constructors

```
Constructor[] constructors = class.getDeclaredConstructors();
```

https://stackoverflow.com/questions/5629706/java-accessing-private-constructor-with-type-parameters


### Question mark vs Object

```
List<?> vs. List<Object>
```

A `List<String>` can be passed to a method that accepts `List<?>` but not `List<Object>`.

https://stackoverflow.com/questions/678822/what-is-the-difference-between-and-object-in-java-generics


### Check if class extends another class

Check if `cls` extends `A.class`.

```
A.class.isAssignableFrom(cls)
```

https://stackoverflow.com/questions/4100281/how-do-i-determine-if-a-class-extends-another-class-in-java


### Remove specific keys from Map

```
map.keySet().removeAll(keySet);
```

https://stackoverflow.com/questions/17675804/remove-multiple-keys-from-map-in-efficient-way


### Remove from map while iterating

```
testMap.entrySet().removeIf(entry -> "Sample".equalsIgnoreCase(entry.getValue()));

Iterator<Map.Entry<String,String>> iter = testMap.entrySet().iterator();
while (iter.hasNext()) {
    Map.Entry<String,String> entry = iter.next();
    if("Sample".equalsIgnoreCase(entry.getValue())){
        iter.remove();
    }
}
```


### List literal

```
// Java 9+
List.of("foo", "bar");
```

https://docs.oracle.com/javase/9/docs/api/java/util/List.html#immutable


### Set intersection

Check if set contains any element of another set

```
// NOTE: disjoint() allows you to pass collections containing different types of elements. Make sure you pass the correct collections!
Collections.disjoint(A, B)
```

https://stackoverflow.com/questions/8708542/something-like-contains-any-for-java-set


### Set literal

```
// Java 9+
Set<String> flavors = Set.of("vanilla", "strawberry", "chocolate", "butter pecan");
```

https://stackoverflow.com/questions/924285/efficiency-of-java-double-brace-initialization


### Update list while iterating

Can use ListIterator.

https://docs.oracle.com/javase/8/docs/api/java/util/ListIterator.html


### Max element in set

```
import java.util.Collections;

Collections.max(myCollection);
```

https://www.geeksforgeeks.org/collections-max-method-in-java-with-examples/


### Set to String

```
String joined = String.join(",", set);
```

https://stackoverflow.com/questions/3042060/fastest-way-to-put-contents-of-setstring-to-a-single-string-with-words-separat


### Get element from Set

```
set.iterator().next();
```

https://stackoverflow.com/questions/20511140/how-to-get-first-item-from-a-java-util-set


### Update Set while iterating

```
// method 1
integerSet.removeIf(integer -> integer.equals(5));

// method 2
Set<Integer> set = new HashSet<Integer>();
Collection<Integer> removeCandidates = new LinkedList<Integer>(set);

for (Integer element : set) {
  if (element % 2 == 0) {
    removeCandidates.add(element);
  }
}

set.removeAll(removeCandidates);
```

https://stackoverflow.com/questions/1110404/remove-elements-from-a-hashset-while-iterating


### UnsupportedOperationException when changing size of list returned by `Arrays.asList()`

```
# Instead, use
Lists.newArrayList()
```

https://stackoverflow.com/questions/1624144/unsupportedoperationexception-when-trying-to-remove-from-the-list-returned-by-ar


### BitSets for Java

Compressed BitSet: https://code.google.com/archive/p/compressedbitset/ (only supports int range)
SparseBitSet: https://github.com/brettwooldridge/SparseBitSet (only supports int range)
LongBitSet:
* http://fastutil.di.unimi.it/docs/it/unimi/dsi/fastutil/longs/LongOpenHashSet.html
* https://github.com/apache/lucene-solr/blob/master/lucene/core/src/java/org/apache/lucene/util/LongBitSet.java


### Enum definition

```
class Enum<E extends Enum<E>>
```

```
public class StatusCode extends Enum<StatusCode>
```

* E=StatusCode
* StatusCode extends Enum<StatusCode>

`enum StatusCode` gets converted to something like the above.

https://docs.oracle.com/javase/8/docs/api/java/lang/Enum.html
http://madbean.com/2004/mb2004-3/


### Get enum declaration name

```
myEnum.name()
```

https://stackoverflow.com/questions/13291076/java-enum-why-use-tostring-instead-of-name


### Import enum values

```
import static apackage.Test.Enum.*;
```

https://stackoverflow.com/questions/1677037/how-can-i-reference-my-java-enum-without-specifying-its-type


### Endianness

Java is Big Endian (which is network byte order, too). Endianness is at the level of bytes, NOT bits.

https://stackoverflow.com/questions/362384/does-java-read-integers-in-little-endian-or-big-endian


### Class initialization

Exception jump table will be loaded (this includes exceptions caught in `catch` blocks).

https://stackoverflow.com/questions/16087926/java-lazy-loading-exceptions

Testing:

```
// ClassNotFoundException
public static void foo() throws CustomException {

// OK
public static void foo() throws Exception {

// ClassNotFoundException
public static void foo() throws Exception {
  throw new CustomException();
}

// ClassNotFoundException
public void foo() throws Exception {
  throw new CustomException();
}

// OK
public static void foo() throws Exception {
  if (false) {
    throw new CustomException();
  }
}

// ClassNotFoundException
public static void foo() throws Exception {
  if (false) {
    throw new CustomException();
  }
}
```


### Concatenate list of strings

```
String joinedFirstNames = list.stream()
  .map(Person::getFirstName)
  .collect(Collectors.joining(", ")); // "John, Anna, Paul"
```

https://stackoverflow.com/questions/1751844/java-convert-liststring-to-a-string


### Avoid string concatenation in logging lines that aren't executed

Add logger level check around logging statement.


### Nonnull annotation

Not actually checked at runtime. Should use `Preconditions.checkNotNull` in addition.


### Suppress FindBugs warnings

```
@edu.umd.cs.findbugs.annotations.SuppressWarnings(value = "DL_SYNCHRONIZATION_ON_BOXED_PRIMITIVE")

```

https://stackoverflow.com/questions/14503001/how-to-suppress-findbugs-warnings-for-fields-or-local-variables


### When to use `volatile`

```
// WRONG!
class BadExample {
    private volatile int counter;

    public void hit(){
        /* This operation is in fact two operations:
         * 1) int tmp = this.counter;
         * 2) this.counter = tmp + 1;
         * and is thus broken (counter becomes fewer
         * than the accurate amount).
         */
        counter++;
    }
}

// RIGHT
class BadExampleFixed {
    private int counter;

    public synchronized void hit(){
        /*
         * Only one thread performs action (1), (2) at a time
         * "atomically", in the sense that other threads can not
         * observe the intermediate state between (1) and (2).
         * Therefore, the counter will be accurate.
         */
        counter++;
    }
}

// RIGHT
class GoodExample {
    private static volatile int temperature;

    //Called by some other thread than main
    public static void todaysTemperature(int temp){
        // This operation is a single operation, so you
        // do not need compound atomicity
        temperature = temp;
    }

    public static void main(String[] args) throws Exception{
        while(true){
           Thread.sleep(2000);
           System.out.println("Today's temperature is "+temperature);
        }
    }
}
```

https://stackoverflow.com/questions/3488703/when-exactly-do-you-use-the-volatile-keyword-in-java


### Double-checked locking idiom

```
// Works with acquire/release semantics for volatile in Java 1.5 and later
// Broken under Java 1.4 and earlier semantics for volatile
class Foo {
    private volatile Helper helper;
    public Helper getHelper() {
        Helper result = helper;
        if (result == null) {
            synchronized(this) {
                result = helper;
                if (result == null) {
                    helper = result = new Helper();
                }
            }
        }
        return result;
    }

    // other functions and members...
}
```

* https://en.wikipedia.org/wiki/Double-checked_locking#Usage_in_Java
* Also see Effective Java Item 71 (p. 283-285).
* The local variable is not strictly necessary but may improve performance.


### Writing hashCode method

Can use `Objects.hash()`.


### Lombok `@Data`

Creates setters, getters, toString, hashCode, equals methods automatically based on fields.

https://projectlombok.org/features/Data


### Wrapping lines

* Break before an operator (so start next line with operator)


### Underscores in numeric literals

```
long creditCardNumber = 1234_5678_9012_3456L;
long socialSecurityNumber = 999_99_9999L;
float pi =  3.14_15F;
long hexBytes = 0xFF_EC_DE_5E;
long hexWords = 0xCAFE_BABE;
long maxLong = 0x7fff_ffff_ffff_ffffL;
byte nybbles = 0b0010_0101;
long bytes = 0b11010010_01101001_10010100_10010010;
```

Since Java 7.

http://docs.oracle.com/javase/7/docs/technotes/guides/language/underscores-literals.html


### Profiler

Try VisualVM in Intellij (see [intellij.md](intellij.md)).

In Settings for Sampler, you can choose packages to profile.

In Settings for Profiler, you can choose classes from which to start profiling.


### Round to decimal places

```
DecimalFormat df = new DecimalFormat();
df.setMaximumFractionDigits(2);
System.out.println(df.format(decimalNumber));

DecimalFormat df = new DecimalFormat("#.00000");
df.format(0.912385);
```

https://stackoverflow.com/questions/2538787/how-to-print-a-float-with-2-decimal-places-in-java
https://stackoverflow.com/questions/153724/how-to-round-a-number-to-n-decimal-places-in-java


### Integer Exponentiation

```
(int) Math.pow(10, 6)

# or BigInteger.pow()
```

https://stackoverflow.com/questions/8071363/calculating-powers-in-java


### List files in directory

```
File curDir = new File(".");
File[] filesList = curDir.listFiles();
for (File f : filesList) {
  System.out.println(f.getName());
}
```

https://stackoverflow.com/questions/15482423/how-to-list-the-files-in-current-directory


### Random long in [m, n)

```
// For 2-digit integers, 10-99 inclusive.
long v = ThreadLocalRandom.current().nextLong(10,100);
```

https://stackoverflow.com/questions/2546078/java-random-long-number-in-0-x-n-range/31682930#31682930


### Random double in [0, 1)

```
Math.random()
```

https://docs.oracle.com/javase/8/docs/api/java/lang/Math.html#random--


### Random boolean (random true/false)

```
import java.util.Random

...

Random random = new Random();
return random.nextBoolean();
```


### Trailing comma

Allowed in array initializer:
```
int a[][] = {{1,2,} ,{3,4,} , {5,6,},}; //Trailing commas cause no compiler error
```

https://stackoverflow.com/questions/11621917/arrays-with-trailing-commas-inside-an-array-initializer-in-java


### Get date in epoch

Use Joda.

```
import org.joda.time.DateTime;

new DateTime(2019, 4, 27, 0, 0).getMillis();
```


### Convert epoch to LocalDate

```
LocalDate.from(Instant.ofEpochMilli(epoch));
```


### Get current year, month, day

```
Date date = new Date();
LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
int year  = localDate.getYear();
int month = localDate.getMonthValue();
int day   = localDate.getDayOfMonth();

# Calendar is weird because months is 0-indexed.
```

https://stackoverflow.com/questions/9474121/i-want-to-get-year-month-day-etc-from-java-date-to-compare-with-gregorian-cal/32363174#32363174
https://stackoverflow.com/questions/9474121/i-want-to-get-year-month-day-etc-from-java-date-to-compare-with-gregorian-cal


### Date math

```
Calendar cal = Calendar.getInstance();
cal.setTime(new Date());
cal.add(Calendar.DAY_OF_YEAR, -3);
Date d = cal.getTime();
```


### Create specific date

```
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
Date d = sdf.parse("21/12/2012");
```

https://stackoverflow.com/questions/6437257/whats-the-right-way-to-create-a-date-in-java


### Date in yyyy-mm-dd format

```
import java.time.Instant;
import java.time.ZoneOffset;

Instant.ofEpochMilli(1593112770000L)
    .atOffset(ZoneOffset.UTC)
    .toLocalDate()
    .toString()
```


### Print current date in time zone

```
import java.time.LocalDate
import java.time.ZoneId

LocalDate.now(ZoneId.of("America/Los_Angeles"))
LocalDate.now(ZoneId.of("America/Los_Angeles")).minusDays(1)

// outputs in ISO-8601 format, e.g.: 2007-12-03
```

Date object is in milliseconds since epoch UTC. Does not include time zone info. You apply time zone info when printing it using a DateFormat.

```
SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd-HH");
dt.setTimeZone(TimeZone.getTimeZone("America/Los_Angeles"));
System.out.println(dt.format(new Date()));
```

https://stackoverflow.com/questions/1305350/how-to-get-the-current-date-and-time-of-your-timezone-in-java


### Check enum equality

```
// null safe
// .equals() defers to ==
enumA == enumB
```

https://stackoverflow.com/questions/1750435/comparing-java-enum-members-or-equals


### Enum class

File can contain only an enum class:

Int.java

```
public enum Int {
    ONE(1),
    TWO(2);

    private final int value;

    Int(final int value) { this.value = value; }

    public int getValue() { return value; }

    @Override
    public String toString() { return "I am integer " + value; }
}
```


### Read file line-by-line | read file line by line

```
try (BufferedReader br = new BufferedReader(new FileReader(file))) {
  for (String line; (line = br.readLine()) != null; ) {
    // process the line.
  }
  // line is not visible here.
}

try (Stream<String> stream = Files.lines(Paths.get(fileName))) {
  stream.forEach(System.out::println);
}
```

https://stackoverflow.com/questions/5868369/how-to-read-a-large-text-file-line-by-line-using-java


### UTF-8 constant

```
import java.nio.charset.StandardCharsets;

...

StandardCharsets.UTF_8.name();
```

https://stackoverflow.com/questions/6698354/where-to-get-utf-8-string-literal-in-java


### Read InputStream into String

```
String theString2 = IOUtils.toString(new FileInputStream(new File("C:/temp/test.txt")), "UTF-8");
```

https://howtodoinjava.com/core-java/io/how-to-read-data-from-inputstream-into-string-in-java/


### Read file into String

```
new String(Files.readAllBytes(Paths.get("/path/to/file")));

FileUtils.readFileToString(new File("/path/to/file"), Charset.defaultCharset());
```

Use commons-io `FileUtils.readFileToString(File file)`.

http://stackoverflow.com/questions/326390/how-do-i-create-a-java-string-from-the-contents-of-a-file


### Multiline strings

`+` should be on newline, per CheckStyle.


### JVM arguments changeable at runtime

```
java -XX:+PrintFlagsFinal -version|grep manageable
```

https://confluence.atlassian.com/kb/how-to-change-jvm-arguments-at-runtime-to-avoid-application-restart-816682109.html


### `-client` vs. `-server` JVM flags

`-client` ignored for 64-bit JDK. `-server` is implicit.

http://stackoverflow.com/questions/198577/real-differences-between-java-server-and-java-client


### jstack

```
jstack <PID> > jstack_out
```

https://docs.oracle.com/javase/7/docs/technotes/tools/share/jstack.html


### Garbage Collection

```
jstat -gcutil <pid> <time between measurements> <number measurements>
jstat -gcutil 11885 1000 10  # 10 measurements, 1 second between each

# can also use -gccause to find out cause of last GC
```

https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstat.html

Major GC is cleaning the Tenured space.
Full GC is cleaning the entire Heap – both Young and Tenured spaces.

https://plumbr.eu/blog/garbage-collection/minor-gc-vs-major-gc-vs-full-gc

```
-gc option
Garbage-collected heap statistics.

S0C: Current survivor space 0 capacity (kB).

S1C: Current survivor space 1 capacity (kB).

S0U: Survivor space 0 utilization (kB).

S1U: Survivor space 1 utilization (kB).

EC: Current eden space capacity (kB).

EU: Eden space utilization (kB).

OC: Current old space capacity (kB).

OU: Old space utilization (kB).

MC: Metaspace capacity (kB).

MU: Metacspace utilization (kB).

CCSC: Compressed class space capacity (kB).

CCSU: Compressed class space used (kB).

YGC: Number of young generation garbage collection events.

# seconds
# https://stackoverflow.com/questions/29798704/specific-meanings-of-jstat-parameters-ygct-fgct-gct
YGCT: Young generation garbage collection time.

FGC: Number of full GC events.

# seconds
# https://stackoverflow.com/questions/29798704/specific-meanings-of-jstat-parameters-ygct-fgct-gct
FGCT: Full garbage collection time.

# YGCT + FGCT
GCT: Total garbage collection time.
```

https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstat.html
https://stackoverflow.com/questions/14464987/interpreting-jstat-results


### JDBC

Connection
* autoCommit true (default) means each statement executed and committed as individual transactions
* autoCommit false means statements are grouped together and terminated by call to commit() or rollback()


### Metaspace

Memory used by JVM to load classes. No default max size (apart from OS limits), so often makes sense to set a max size yourself:

```
-XX:MaxMetaspaceSize=<metaspace size>[g|m|k]
```

http://stackoverflow.com/questions/27131165/what-is-the-difference-between-permgen-and-metaspace
http://blog.sokolenko.me/2014/11/javavm-options-production.html


### LinkageError

Generally happens when you have the same class loaded by multipled classloaders and try to use them together. Classes loaded in separate classloaders (even from identical jars) are treated as two separate classes.

http://stackoverflow.com/questions/244482/how-to-deal-with-linkageerrors-in-java


### Memory usage at runtime

```
Runtime.getRuntime().totalMemory()
Runtime.getRuntime().freeMemory()

// amount of memory currently in use
Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()
```
http://stackoverflow.com/questions/17374743/how-can-i-get-the-memory-that-my-java-program-uses-via-javas-runtime-api


### Class of primitive type

```
byte[].class
```


### Convert Array to List

```
Arrays.asList("intField", "stringField");
Arrays.asList(new Foo(), new Foo());
```


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
    * class only (NOT object. Object of type C can access private fields of another object of type C: http://stackoverflow.com/questions/17027139/access-private-field-of-another-object-in-same-class)


### Top-level class/interface accessibility modifiers

See http://stackoverflow.com/questions/6734849/why-cant-a-class-or-an-interface-receive-private-or-protected-access-modifiers. Top-level classes and interfaces can only have "public" or "package private" (default) accessibilities. Nested classes and interfaces can have private or protected modifiers


### Method Pointer / Method Reference

Not a true method pointer, just syntactic sugar for method invocation.

```
# in lambda expression
Person::compareByAge
# is equivalent to
(a, b) -> Person.compareByAge(a, b)
```

https://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html


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

If jar, extract/unzip jar first.

```
# unzip the jar first

# -c prints disassembled code for each method in class
# -p prints all classes and members (including private ones)
javap -c -p AvroGenericRecordReader
```

Output explanations:

* `invokevirtual` calls a class method
* `invokeinterface` class an interface mthod


### Pipe output stream to a String

See http://stac
koverflow.com/questions/216894/get-an-outputstream-into-a-string.
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


### Print classpath

```
ClassLoader cl = ClassLoader.getSystemClassLoader();
URL[] urls = ((URLClassLoader)cl).getURLs();
for(URL url: urls){
  System.out.println(url.getFile());
}
```

https://www.mkyong.com/java/how-to-print-out-the-current-project-classpath/


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

```
<init>  # inside constructor or while initializing variables
```

http://stackoverflow.com/questions/11789990/what-does-init-signify-in-a-java-exception

See http://stackoverflow.com/questions/2945862/interpreting-java-lang-nosuchmethoderror-message and http://docs.oracle.com/javase/specs/jvms/se7/html/jvms-4.html#jvms-4.3. Also see http://stackoverflow.com/a/357386/1128392.

* `[TYPE` means array of TYPE (`[Ljava.lang.Object` means array of Object)
* `B` means byte
* `I` means integer
* `Lfoo.bar.ClassName;` means the type is foo.bar.ClassName
* `V` means void
* `Z` means boolean
* `[B` byte array
* `[C` char array

Return type follows closing parenthesis


### Read file with explicit encoding

```
new InputStreamReader(new FileInputStream(filePath), encoding)
```

https://stackoverflow.com/questions/696626/java-filereader-encoding-issue


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


### Inline thread / lambda thread

```
Thread t = new Thread(() -> {
    // your code here ...
});
```

https://alvinalexander.com/java/java-8-lambda-thread-runnable-syntax-examples/


### Run background thread

```
new Thread(new Runnable() {
    @Override
    public void run() {
        // Time consuming task.
    }
}).start();
// The method continues without stopping.
```

https://stackoverflow.com/questions/36408498/background-processing-java


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


### Create empty file

```
File file = new File("/tmp/foo");
file.createNewFile();
```

http://www.technicalkeeda.com/java-tutorials/create-new-empty-file-using-java


### Make temp dir / make temporary directory

```
# Guava
File f = Files.createTempDir();

Path tempDirWithPrefix = Files.createTempDirectory(prefix);
```

https://google.github.io/guava/releases/23.0/api/docs/com/google/common/io/Files.html#createTempDir--

https://stackoverflow.com/questions/617414/how-to-create-a-temporary-directory-folder-in-java


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


### Case-insensitive map

```
Map<String, String> map = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
map.put("a", "a");
map.put("A", "A");  // will override "a", map will still only contain 1 element.
```

https://codereview.stackexchange.com/questions/183127/map-with-case-insensitive-get-remove-and-containskey


### Case-insensitive regex

```
String target = "FOOBar";
target = target.replaceAll("(?i)foo", "");
System.out.println(target);
```

http://stackoverflow.com/questions/5054995/how-to-replace-case-insensitive-literal-substrings-in-java


### Named capture group

```
(?<name>capturing text)
```

https://stackoverflow.com/questions/415580/regex-named-groups-in-java


### Java Pattern Matcher capture groups example

```
String line = "This order was placed for QT3000! OK?";
Pattern pattern = Pattern.compile("(.*?)(\\d+)(.*)");
Matcher matcher = pattern.matcher(line);
while (matcher.find()) {
    System.out.println("group 1: " + matcher.group(1));
    System.out.println("group 2: " + matcher.group(2));
    System.out.println("group 3: " + matcher.group(3));
}
```

https://stackoverflow.com/questions/17969436/java-regex-capturing-groups


### Regex replace

```
// Capturing groups indexed left to right, starting from 1
str = str.replaceAll("<b>([^<]*)</b>", "$1");
```

http://www.javamex.com/tutorials/regular_expressions/search_replace.shtml


### Java String.matches()

Must match ENTIRE string. See http://stackoverflow.com/questions/8923398/regex-doesnt-work-in-string-matches for details.


### Try with resources

```
try (BufferedReader br =
               new BufferedReader(new FileReader(path))) {
    return br.readLine();
}
```

https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html


### Get resource file path

In Java project, in Gradle and in IDE, working directory is generally root project directory. You can construct relative paths from it.

```
private static final String RESOURCES_DIR = new File("./my-sub-module/src/test/resources").getAbsolutePath();
```

```
File file = new File(getClass().getClassLoader().getResource("file/test.xml").getFile());

# read resource file into string
FileUtils.readFileToString(new File(getClass().getClassLoader().getResource("file/test.xml").getFile()));

# using Guava
File f = new File(Resources.getResource("var/conf/runtime.yml").getFile());
```

https://www.mkyong.com/java/java-read-a-file-from-resources-folder/


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


### Convert String to Class

```
Class c = Class.forName("package.name.Bean1");
c.newInstance();
```

https://stackoverflow.com/questions/4030618/java-string-to-class


### Write line-by-line to file

```
FileWriter f0 = new FileWriter("output.txt");

String newLine = System.getProperty("line.separator");


for(i=0;i<10;i++)
{
    f0.write("Result "+ i +" : "+ ans + newLine);
}
f0.close();
```

https://stackoverflow.com/questions/15726972/using-for-loop-write-lines-one-by-one-in-file-using-java


### Write String to file

```
PrintWriter out = new PrintWriter("filename.txt");
out.println(text);

# wrap output stream
try (PrintWriter p = new PrintWriter(new FileOutputStream("output-text.txt", true))) {
    p.println("Hello");
} catch (FileNotFoundException e1) {
    e1.printStackTrace();
}
```

http://stackoverflow.com/questions/1053467/how-do-i-save-a-string-to-a-text-file-using-java

https://stackoverflow.com/questions/4069028/write-string-to-output-stream


### Functional interface

A functional interface is any interface that contains only one abstract method.

* https://docs.oracle.com/javase/8/docs/api/java/util/function/package-summary.html#package.description
* https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html#approach5


### Fill array / initialize array

```
Arrays.fill(v, desiredNumResultsPerIntent);
```


### forEach

```
import java.util.List;
import java.util.ArrayList;
public class Example {
   public static void main(String[] args) {
      List<String> fruits = new ArrayList<String>();
      fruits.add("Apple");
      fruits.add("Orange");
      fruits.add("Banana");
      fruits.add("Pear");
      fruits.add("Mango");
      //lambda expression in forEach Method
      fruits.forEach(str->System.out.println(str));
   }
}
```

https://beginnersbook.com/2017/10/java-8-foreach/


### Stream array

```
String[] array = {"a", "b", "c", "d", "e"};

//Arrays.stream
Stream<String> stream1 = Arrays.stream(array);
stream1.forEach(x -> System.out.println(x));

//Stream.of
Stream<String> stream2 = Stream.of(array);
stream2.forEach(x -> System.out.println(x));
```

https://www.mkyong.com/java8/java-how-to-convert-array-to-stream/


### Sum integers using Stream API

```
Map<String, Integer> integers;
integers.values().stream().mapToInt(Integer::intValue).sum();
```

https://stackoverflow.com/questions/30125296/how-to-sum-a-list-of-integers-with-java-streams


### Streams

Streams consist of:

(1) source
(2) intermediate operations
(3) terminal perations

(2) is not executed until (3) is. (2) return new streams. Streams are functional and return new streams rather than modifying the original stream. E.g.: Filtering a Collection stream returns a new stream and does not modify the original Collection.

When (3) is performed, the stream is consumed and can no longer be used. You must create a new stream from the source if you want to traverse the data again.

```
int sum = widgets.stream()
                 .filter(w -> w.getColor() == RED)
                 .mapToInt(w -> w.getWeight())
                 .sum();

List<String> l = new ArrayList(Arrays.asList("one", "two"));
Stream<String> sl = l.stream();
l.add("three");
String s = sl.collect(joining(" "));

int sum = numbers.parallelStream().reduce(0, Integer::sum);

List<String> strings = stream.map(Object::toString)
                             .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);
```

https://docs.oracle.com/javase/8/docs/api/java/util/stream/package-summary.html
http://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html


### `java -cp` vs. `java -jar`

You cannot specify both.

http://stackoverflow.com/questions/11922681/differences-between-java-cp-and-java-jar

```
# java -cp example
java -cp `hadoop classpath`:$HIVE_HOME/lib/*:$HIVE_CONF_DIR:. groovy.ui.GroovyMain ...
```


### `java` vs. `javax` packages

Historical thing. Not much difference now.
http://stackoverflow.com/questions/727844/javax-vs-java-package


### Debug remote Java process

```
ssh -L 8000:localhost:8000 user@remotehost.com
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=8000 ...
# Connect in IntelliJ, debug Remote Application, set port to 8000
```


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

# continue
cont

print MyClass.myStaticField
print myObj.myInstanceField
print i + j + k (i, j, k are primities and either fields or local variables)
print myObj.myMethod() (if myMethod returns a non-null)
print new java.lang.String("Hello").length()
```

http://docs.oracle.com/javase/8/docs/technotes/tools/windows/jdb.html