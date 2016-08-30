### Sort List
```
scala> var a = List((0,1),(1,0))

# Sort by second element in list
scala> a.sortBy(x => x._2)
res1: List[(Int, Int)] = List((1,0), (0,1))
```


### Covariance
http://stackoverflow.com/questions/4531455/whats-the-difference-between-ab-and-b-in-scala/4531696#4531696


### Type Bounds
An upper type bound `T <: A` declares that type variable T refers to a subtype of type A. `A` is an upper bound of type `T`.

http://docs.scala-lang.org/tutorials/tour/upper-type-bounds


### Method Accessibility Scope

```
// object-private: only the instance of the object can use it
private[this] def isFoo = true

// private: like in Java
private def isFoo = true
```
http://alvinalexander.com/scala/how-to-control-scala-method-scope-object-private-package


### Triple Equals (`===`)
* Gives better error messages when used with `assert`.
* http://stackoverflow.com/questions/10489548/what-is-the-triple-equals-operator-in-scala-koans

* Throws an exception when types are different (in ScalaUtils and Scalaz)
* http://stackoverflow.com/questions/9084464/scala-equality-with-type-checking


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
// gets converted to
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
```

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


### Constructors
Primary constructor's parameter list always comes right after class name. Auxiliary constructors can be defined using `this` and must directly call another auxiliary constructor or the primary constructor.

```
class Greeter(message: String, secondaryMessage: String) {
    def this(message: String) = this(message, "")

    def SayHi() = println(message + secondaryMessage)
}
```
http://joelabrahamsson.com/learning-scala-part-four-classes-and-constructors/


### Case classes and pattern matching
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


### Scala does not support static methods or fields
Instead of static members, you create singleton objects.


### Scala singletons
For every Scala singleton object, the compiler will create a Java class for the object with a dollar sign added to the end.
* http://stackoverflow.com/questions/5721046/singletons-as-synthetic-classes-in-scala

```
// "object" will create a singleton
// http://www.scala-lang.org/docu/files/ScalaTutorial.pdf
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