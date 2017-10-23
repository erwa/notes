### `Predef.identity`
Function that returns input unchanged.

http://stackoverflow.com/questions/28407482/what-does-predef-identity-do-in-scala


### `???`
```
def doSomething(s: String): Int = ???
```

Defined in Predef as:
```
/**
 * `???` can be used for marking methods that remain to be implemented.
 *  @throws NotImplementedError
 */
def ??? : Nothing = throw new NotImplementedError
```
http://alvinalexander.com/scala/what-does-three-question-marks-in-scala-mean


### Object class names
```
object HelloWorld {}

HelloWorld.getClass.getName  // HelloWorld$ (note $ at end)
```


### Convert Scala Map to Java Map
```
import scala.collection.JavaConverters._

Map("foo" -> "bar").asJava
```


### JUnit BeforeClass
```
object TestClass {

  @BeforeClass
  def stuff() {
    // beforeclass stuff
  }

}

class TestClass {

  @Test
  ...

}
```
http://stackoverflow.com/questions/5751686/how-do-you-implement-beforeclass-semantics-in-a-junit-4-test-written-in-scala


### Current time
```
import java.util.Calendar
Calendar.getInstance().getTime()
```
http://alvinalexander.com/scala/scala-get-current-date-time-hour-calendar-example


### Incremental Builds
Use Zinc. scala-maven-plugin has support for Zinc. Analysis cache files are stored in `${project.build.directory}/analysis/compile` by default (e.g.: `<module>/target/analysis/compile`)

http://davidb.github.io/scala-maven-plugin/compile-mojo.html#analysisCacheFile


### Show compilation details
```
scala -Xprint:typer -e "val a = 2; ~a"
...
private[this] val a: Int = 2;
private <stable> <accessor> def a: Int = $anon.this.a;
$anon.this.a.unary_~
```
http://stackoverflow.com/questions/9442437/the-tilde-operator-in-scala


### Compatibility between versions
2.11 is NOT binary compatible wtih 2.10.
2.10 code should still compile against 2.11, unless it was using certain experimental features.

https://www.scala-lang.org/news/2.11.0

To run Scala classes compiled for a certain version of Scala, you only need to have that Scala library jar version on your classpath.

http://stackoverflow.com/questions/1893714/can-a-scala-program-be-compiled-to-run-on-any-jvm-without-having-scala-installe


### Cross-building
```
# sbt
+ package  # build against all versions listed in build.scala.versions
```
http://www.scala-sbt.org/0.12.2/docs/Detailed-Topics/Cross-Build.html#cross-buildiwng-a-project


### Multiline Strings
```
"""multi
line
string"""
```
https://www.safaribooksonline.com/library/view/scala-cookbook/9781449340292/ch01s03.html


### Print Scala version
```
util.Properties.versionString
```
http://stackoverflow.com/questions/6121403/how-do-i-get-the-scala-version-from-within-scala-itself


### Apply function to values in map
```
m.transform{ (key, value) => if (k(key)) f(value) else value }
```
http://stackoverflow.com/questions/23242235/in-scala-apply-function-to-values-for-some-keys-in-immutable-map


### foreach loop
```
val x = List(1,2,3)
x.foreach { println }
```
http://alvinalexander.com/scala/iterating-scala-lists-foreach-for-comprehension


### For comprehension
```
val names = Vector("Bob", "Fred", "Joe", "Julia", "Kim")
for (name <- names if name.startsWith("J"))
```


### Add element to set
```
// use var with mutable
var set = scala.collection.mutable.Set[Int]()

// add one element
set += 1

// add multiple elements
set += (2, 3)
```

https://www.safaribooksonline.com/library/view/scala-cookbook/9781449340292/ch11s25.html


### Build and run
Test.scala:
```
object HelloWorld {
  def main(args: Array[String]) {
    println("hello, world!")
  }
}
```

```
scalac Test.scala && scala HelloWorld
```



### String Interpolation

```
// s string, allows direct use of variables in strings
val name = "James"
println(s"Hello, $name")  // Hello, James
```
http://docs.scala-lang.org/overviews/core/string-interpolation.html


### Type-Relation Operators
```
<:<
=:=
```


### Types

All values are objects (no primitives). Numbers are objects. Functions are objects.

All values are instances of a class.

http://docs.scala-lang.org/tutorials/tour/unified-types.html


### Sort List
```
scala> var a = List((0,1),(1,0))

# Sort by second element in list
scala> a.sortBy(x => x._2)
res1: List[(Int, Int)] = List((1,0), (0,1))
```


### Covariance
http://stackoverflow.com/questions/4531455/whats-the-difference-between-ab-and-b-in-scala/4531696#4531696


### Context Bounds
```
def maxList[T: Ordering](elements: List[T]): T = ...

# is equivalent to

def maxList[T](elements: List[T])
  (implicit ordering: Ordering[T]): T = ...
```

Programming in Scala, Section 21.6.

```
Generally, a type parameter with a context bound is of the form [T: Bound]; it is expanded to plain type parameter T together with an implicit parameter of type Bound[T].
```

http://stackoverflow.com/questions/2982276/what-is-a-context-bound-in-scala

`[T: Bound]` -> `T` + implicit `Bound[T]`.

```
def foo[T: Manifest](x: List[T]) = ...
// is equivalent to
def foo[T](x: List[T])(implicit m: Manifest[T]) = ...
```

`Manifest` is basically used to preserve type information at runtime (which is generally not available to JVM). Ref: http://stackoverflow.com/questions/3213510/what-is-a-manifest-in-scala-and-when-do-you-need-it


### Type Bounds

An upper type bound `T <: A` declares that type variable T refers to a subtype of type A. `A` is an upper bound of type `T`.

http://docs.scala-lang.org/tutorials/tour/upper-type-bounds


### Method Accessibility Scope

```
// PACKAGE_NAME / CLASS_NAME must enclose the definition

// only members of the package PACKAGE_NAME can access
private[PACKAGE_NAME] ...

// only accessible from CLASS_NAME (not much point for this, same as private without qualifier)
private[CLASS_NAME]

// object-private: only the instance of the object can use it
private[this] def isFoo = true

// private: like in Java
private def isFoo = true
```
http://stackoverflow.com/questions/26664365/scala-parameters-for-access-modifiers
http://alvinalexander.com/scala/how-to-control-scala-method-scope-object-private-package


### Triple Equals (`===`)
* Gives better error messages when used with `assert`.
* http://stackoverflow.com/questions/10489548/what-is-the-triple-equals-operator-in-scala-koans

* Throws an exception when types are different (in ScalaUtils and Scalaz)
* http://stackoverflow.com/questions/9084464/scala-equality-with-type-checking


### Extractor

http://docs.scala-lang.org/tutorials/tour/extractor-objects.html
```
object Twice {
  def apply(x: Int): Int = x * 2
  def unapply(z: Int): Option[Int] = if (z%2 == 0) Some(z/2) else None
}
object TwiceTest extends App {
  val x = Twice(21)
  x match { case Twice(n) => Console.println(n) } // prints 21
}
```

```
The return type of an unapply should be chosen as follows:

* If it is just a test, return a Boolean. For instance case even()
* If it returns a single sub-value of type T, return an Option[T]
* If you want to return several sub-values T1,...,Tn, group them in an optional tuple Option[(T1,...,Tn)].
```


### `apply` / `unapply`
```
// `apply` lets you treat object like a function
obj(a, b, c)
// gets converted to
obj.apply(a, b, c)

// `unapply` used in pattern matching
object Foo {
  def unapply(x : Int) : Option[String] =
    if(x == 0) Some("Hello, World") else None
}

val Foo(str) = x
// gets converted to (is syntactic sugar for)
val str : String = Foo.unapply(x) match {
  case Some(s) => s
  case None    => throw new scala.MatchError(x)
}
```
http://stackoverflow.com/questions/18468786/using-apply-unapply


### Run Scala file
```
scala foo.scala
```
https://blog.ajduke.in/2013/05/31/various-ways-to-run-scala-code/


### Scala REPL
```
$ scala

// To quit
scala> :q
```


### Mixin Class Composition
In Scala, a class can only inherit from one other class.
https://www.safaribooksonline.com/blog/2013/05/30/traits-how-scala-tames-multiple-inheritance/

However, using mixin, you can inherit from one class and also inherit definitions from other traits
```
trait Drawable {
    def draw() { }
}

trait Cowboy extends Drawable {
    override def draw() { println("Bang!") }
}

trait Artist extends Drawable {
    override def draw() { println("A pretty painting") }
}

// Note: the "with" keyword goes between type names for multiple inheritance
// You can chain on multiple "with X" clauses to mix in more traits. If a
// class is to be part of the extended type, it must be specified _before_
// the first "with X" clause.
class CowboyArtist extends Cowboy with Artist

object Main extends App {
    (new CowboyArtist()).draw() // Outputs "A pretty painting"
}
```

More info: http://docs.scala-lang.org/tutorials/tour/mixin-class-composition.html


### Arrays
String Array type:
```
Array[String]
```

### Immutable vs. Mutable Variables
Use `val` for immutable variables, `var` for mutable ones.
```
val v = ... // immutable
var w = ... // mutable
```
http://joelabrahamsson.com/learning-scala-part-four-classes-and-constructors/


### Get type of variable
```
myVar.getClass
```


### Symbol
```
// Create a Symbol
'foo // invokes Symbol('foo')
```
http://stackoverflow.com/questions/918590/what-does-a-single-apostrophe-mean-in-scala


### Tuple literal
```
(1,2,3) // Tuple3

val t = (1,2,3)
t._1 // first element of tuple
```
https://www.tutorialspoint.com/scala/scala_tuples.htm


### ArrowAssoc (dash greater than, hyphen great than)
key->value creates a tuple (key,value)
```
"a"->1

// String does not contain the `->` method, so look for an implicit conversion
// to a type that has the `->` method.

// Triggers an implicit conversion, because Predef.scala is automatically
// in scope and includes a conversion from Any to ArrowAssoc, which contains the
// `->` method.

// Implicit conversion in Predef.scala from Any to ArrowAssoc
implicit def any2ArrowAssoc[A](x: A): ArrowAssoc[A] = new ArrowAssoc(x)

class ArrowAssoc[A](x: A) {
    def -> [B](y: B): Tuple2[A, B] = Tuple2(x, y)
}

# Scala essentially converts `"a"->1` to:
any2ArrowAssoc("a").->(1)
# which returns a Tuple2("a", 1)
```
http://stackoverflow.com/questions/4980515/scala-maps-operator


### Function Type Parameters
Scala uses `[T]` as opposed to `<T>`.

```
def f[T](x: T) = x     //> f: [T](x: T)T
val g = f _            //> g: Nothing => Nothing = <function1>
// g(2)                // error
val h: Int=>Int = f _  //> h  : Int => Int = <function2>
h(2)                   //> res0: Int = 2
```
http://stackoverflow.com/questions/15264838/in-scala-can-generic-type-parameters-be-used-with-function-definitions


### Call-by-name
```
object Test {
   def main(args: Array[String]) {
        delayed(time());
   }

   def time() = {
      println("Getting time in nano seconds")
      System.nanoTime
   }

   // Each time `t` is accessed by `delayed`, `time` is evaluated
   def delayed( t: => Long ) = {
      println("In delayed method")
      println("Param: " + t)
      t
   }
}
```

```
C:/>scalac Test.scala
C:/>scala Test
In delayed method
Getting time in nano seconds
Param: 81303808765843
Getting time in nano seconds

C:/>
```


### Partially Applied Functions
```
import java.util.Date

object Test {
   def main(args: Array[String]) {
      val date = new Date
      val logWithDateBound = log(date, _ : String)

      logWithDateBound("message1" )
      Thread.sleep(1000)
      logWithDateBound("message2" )
      Thread.sleep(1000)
      logWithDateBound("message3" )
   }

   def log(date: Date, message: String)  = {
     println(date + "----" + message)
   }
}
```
http://www.tutorialspoint.com/scala/partially_applied_functions.htm


### Multiple Parameter Lists
```
scala> def foo(as: Int*)(bs: Int*)(cs: Int*) = as.sum * bs.sum * cs.sum
foo: (as: Int*)(bs: Int*)(cs: Int*)Int

scala> foo(1, 2, 3)(4, 5, 6, 7, 9)(10, 11)
res7: Int = 3906
```
http://stackoverflow.com/questions/4684185/why-does-scala-provide-both-multiple-parameters-lists-and-multiple-parameters-pe


### Implicit class

Has implicit constructor that can take at most one non-implicit parameter. Adds methods to the non-implicit parameter.

```
object Helpers {
  implicit class IntWithTimes(x: Int) {
    def times[A](f: => A): Unit = {
      def loop(current: Int): Unit =
        if(current > 0) {
          f
          loop(current - 1)
        }
      loop(x)
    }
  }
}

scala> import Helpers._
import Helpers._
scala> 5 times println("HI")
HI
HI
HI
HI
HI
```

http://docs.scala-lang.org/overviews/core/implicit-classes.html


### Implicit Parameters
If not explicitly specified, Scala will try to fill in the value implicitly.
```
abstract class SemiGroup[A] {
  def add(x: A, y: A): A
}

abstract class Monoid[A] extends SemiGroup[A] {
  def unit: A
}

object ImplicitTest extends App {
  implicit object StringMonoid extends Monoid[String] {
    def add(x: String, y: String): String = x concat y
    def unit: String = ""
  }

  implicit object IntMonoid extends Monoid[Int] {
    def add(x: Int, y: Int): Int = x + y
    def unit: Int = 0
  }

  def sum[A](xs: List[A])(implicit m: Monoid[A]): A =
    if (xs.isEmpty) m.unit
    else m.add(xs.head, sum(xs.tail))

  // The Monoid[A] is not passed explicitly, so Scala
  // looks for available implicit objects it can pass.
  // The implicit object is in scope and defined in the
  // ImplicitTest object.
  println(sum(List(1, 2, 3)))
  println(sum(List("a", "b", "c")))
}
```

http://stackoverflow.com/questions/5512397/passing-scala-math-integral-as-implicit-parameter
http://docs.scala-lang.org/tutorials/tour/implicit-parameters.html
http://docs.scala-lang.org/tutorials/FAQ/finding-implicits.html


### Variable arguments
```
def printAll(strings: String*) {
  strings.foreach(println)
}
```
http://alvinalexander.com/scala/how-to-define-methods-variable-arguments-varargs-fields


### Repeated Parameters
Passing Seq to function that takes varargs

> When a parameter is followed by `: _*`, this tells Scala to expand the argument to a variable argument list rather than a single argument.

http://blog.darevay.com/2009/01/remedial-scala-repeated-parameters-and-initializing-collections/


### Default values
```
class Reference[T] {
  // `_` means default value
  private var contents: T = _

  def set(value: T) { contents = value }
  def get: T = contents
}
```


### Traits
* Like Java interfaces
* Can contain methods
* Classes that inherit (`extends`) a trait must implements its interface

```
trait Ord {
  def < (that: Any): Boolean
  def <=(that: Any): Boolean = (this < that) || (this == that)
  def > (that: Any): Boolean = !(this <= that)
  def >=(that: Any): Boolean = !(this < that)
}

class Date(y: Int, m: Int, d: Int) extends Ord {
  def year = y
  def month = m
  def day = d
  override def toString(): String = year + "-" + month + "-" + day

  override def equals(that: Any): Boolean =
    that.isInstanceOf[Date] && {
      val o = that.asInstanceOf[Date]
      o.day == day && o.month == month && o.year == year
    }

  def <(that: Any): Boolean = {
    if (!that.isInstanceOf[Date])
      error("cannot compare " + that + " and a Date")

    val o = that.asInstanceOf[Date]
    (year < o.year) ||
    (year == o.year && (month < o.month ||
                       (month == o.month && day < o.day)))
  }
```


### Cast operator
```
val o = that.asInstanceOf[Date]
```


### Cast Long to Int
```
.toInt
```
http://stackoverflow.com/questions/7782502/how-to-cast-long-to-int-in-scala


### Invoke superclass constructor
```
class LineElement(s: String) extends ArrayElement(Array(s)) { ... }

class ArrayElement(conts: Array[String]) extends Element { ...}
```

Programming in Scala, Section 10.7, p. 193


### Constructors

Primary constructor's parameter list always comes right after class name. Auxiliary constructors can be defined using `this` and must directly call another auxiliary constructor or the primary constructor.

```
class Greeter(message: String, secondaryMessage: String) {
    def this(message: String) = this(message, "")

    def SayHi() = println(message + secondaryMessage)
}
```
http://joelabrahamsson.com/learning-scala-part-four-classes-and-constructors/


### Companion class

* A class and its companion object must be defined in same source file.
* A class and its companion can access each others' private members. They are like C++ "friends" (ref: http://www.cplusplus.com/doc/tutorial/inheritance/). If you want to make a member truly private, use `private[this]`.
* The class associated with a singleton object is known as the "companion class".

http://docs.scala-lang.org/tutorials/tour/singleton-objects.html


### `new` keyword
Need when using Java classes, which rarely have companion objects with an `apply` method. Use `new` if you want to use a class's own constructor as opposed to its companion object's `apply` method.


### Case classes and pattern matching

Compared by structure and not reference.

http://docs.scala-lang.org/tour/case-classes.html

```
object MatchTest2 extends App {
  def matchTest(x: Any): Any = x match {
    case 1 => "one"
    case "two" => 2
    case y: Int => "scala.Int"
  }
  println(matchTest("two"))
}
```
http://docs.scala-lang.org/tutorials/tour/pattern-matching.html

Case statements support if expressions (guards)
```
i match {
  case a if 0 to 9 contains a => println("0-9 range: " + a)
  case b if 10 to 19 contains b => println("10-19 range: " + b)
  case c if 20 to 29 contains c => println("20-29 range: " + c)
  case _ => println("Hmmm...")
}
```
https://www.safaribooksonline.com/library/view/scala-cookbook/9781449340292/ch03s14.html

Regular classes that are

* Immutable by default
* Decomposable through pattern matching
* Compared by structural equality instead of by reference
* Succinct to instantiate and operate on

```
It only makes sense to define case classes if pattern matching is used to decompose data structures.
```
http://docs.scala-lang.org/tutorials/tour/case-classes

Scala turns
```
case class Foo()
```

into
```
class Foo { }
object Foo {
    def apply() = new Foo
}
```
http://stackoverflow.com/questions/9727637/new-keyword-in-scala


http://www.scala-lang.org/docu/files/ScalaTutorial.pdf section 6
```
abstract class Tree

// Getter methods automatically defined for constructor parameters
case class Sum(l: Tree, r: Tree) extends Tree
case class Var(n: String) extends Tree
case class Const(v: Int) extends Tree

{ case "x" => 5 }
type Environment = String => Int

def eval(t: Tree, env: Environment): Int = t match {
  case Sum(l, r) => eval(l, env) + eval(r, env)
  case Var(n) => env(n)
  case Const(v) => v
}

def derive(t: Tree, v: String): Tree = t match {
  case Sum(l, r) => Sum(derive(l, v), derive(r, v))

  // `if (v == n)` is a `guard`
  case Var(n) if (v == n) => Const(1)

  // `_` is a wildcard
  case _ => Const(0)
}

def main(args: Array[String]) {
  val exp: Tree = Sum(Sum(Var("x"),Var("x")),Sum(Const(7),Var("y")))
  val env: Environment = { case "x" => 5 case "y" => 7 }
  println("Expression: " + exp)
  println("Evaluation with x=5, y=7: " + eval(exp, env))
  println("Derivative relative to x:\n " + derive(exp, "x"))
  println("Derivative relative to y:\n " + derive(exp, "y"))
}
```


### Methods without arguments
```
class Complex(real: Double, imaginary: Double) {
  def re = real
  def im = imaginary
}

val c = new Complex(1.2, 3.4)
println("imaginary part: " + c.im)
```


### No-argument, no-return (void) function
```
def oncePerSecond(callback: () => Unit) {
  while (true) { callback(); Thread sleep 1000 }
}
// callback is a no-arg function that returns nothing
// `Unit` is like `void` in Java
```

### Anonymous Function
```
def main(args: Array[String]) {
  oncePerSecond(() =>
    println("time flies like an arrow..."))
}
```


### Everything is an object
Including numbers are functions.
```
1 + 2 * 3 / x
// is equivalent to
(1).+(((2).*(3))./(x))
```


### infix notation
One-argument method calls can use infix syntax:
```
// The following are equivalent
df.format(now)
df format now
```


### Static fields

Scala does not support static methods or fields. Instead of static members, you create singleton objects.

```
import java.util.concurrent.atomic.AtomicInteger

object Foo {
  val counter = new AtomicInteger(0)
}

class Foo {
  val i = Foo.counter.incrementAndGet()
  println(i)
}
```
http://stackoverflow.com/questions/20963080/static-field-in-scala-companion-object


### Scala singletons
For every Scala singleton object, the compiler will create a Java class for the object with a dollar sign added to the end.
* http://stackoverflow.com/questions/5721046/singletons-as-synthetic-classes-in-scala

```
// "object" will create a singleton
// http://www.scala-lang.org/docu/files/ScalaTutorial.pdf
// Think of "object" as singleton of implicit class
object HelloWorld {
  def main(args: Array[String]) {
    println("Hello, world!")
  }
}
```

### Scala objects do not exist in Java
* http://stackoverflow.com/questions/9350528/how-to-work-with-javap-for-scala-java-interoperability
* Every Scala object X causes two JVM class files to be generated:
```
X.class  // Like an interface, includes static methods to access fields and methods

X$.class // Singleton class, cannot be instantiated
         // Has field MODULE$ which holds singleton instance of class

object X { val i = 5 }
X.i();
X$.MODULE$.i();
```

### Converting Java object to Scala object
```
import scala.collection.JavaConversions._
```
http://stackoverflow.com/questions/6356465/how-to-get-scala-list-from-java-list

### Print to stdout
```
println("foo")
```