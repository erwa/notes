### `getText()`
https://github.com/apache/groovy/blob/master/src/main/org/codehaus/groovy/runtime/IOGroovyMethods.java#L809


### Number Type Suffixes
```
// BigDecimal
1G
1g
```
http://docs.groovy-lang.org/next/html/documentation/core-syntax.html#_number_type_suffixes


### Memoization
```
fib = { long n -> n<2?n:fib(n-1)+fib(n-2) }.memoize()
assert fib(25) == 75025 // fast!
```
http://groovy-lang.org/closures.html#_memoization
http://docs.groovy-lang.org/2.4.7/html/gapi/groovy/transform/Memoized.html


### DSLs

```
show = { println it }
square_root = { Math.sqrt(it) }

def please(action) {
  [the: { what ->
    [of: { n -> action(what(n)) }]
  }]
}

// equivalent to: please(show).the(square_root).of(100)
please show the square_root of 100
// ==> 10.0
```
http://docs.groovy-lang.org/latest/html/documentation/core-domain-specific-languages.html


### Command Chain
"Command chain" feature allows you to omit parentheses and dots in method chains.
```
// equivalent to: turn(left).then(right)
turn left then right

// equivalent to: take(2.pills).of(chloroquinine).after(6.hours)
take 2.pills of chloroquinine after 6.hours

// equivalent to: paint(wall).with(red, green).and(yellow)
paint wall with red, green and yellow

// with named parameters too
// equivalent to: check(that: margarita).tastes(good)
check that: margarita tastes good

// with closures as parameters
// equivalent to: given({}).when({}).then({})
given { } when { } then { }

// equivalent to: select(all).unique().from(names)
select all unique() from names
```
http://docs.groovy-lang.org/latest/html/documentation/core-domain-specific-languages.html


### leftShift operator (`<<`)
Overloaded for adding elements to maps, lists:
```
def list = [1,2]
list << 3
assert list == [1,2,3]

def map = [a:1, b:2]
map << [c:3, d:4]
assert map == [a:1, b:2, c:3, d:4]
```
http://docs.groovy-lang.org/latest/html/groovy-jdk/java/util/Map.html#leftShift(java.util.Map)


### Run Groovy using groovy-all jar
```
java -cp 'src:.:lib/*' groovy.ui.GroovyMain src/com/example/MyScript.groovy
```
http://stackoverflow.com/questions/12391985/when-running-groovy-scripts-using-the-groovy-all-jar-how-do-you-specify-a-class


### GStrings
See http://docs.groovy-lang.org/latest/html/documentation/index.html#all-strings. String interpolation only works in double-quoted strings, not single- or triple-quoted strings.
```
foxtype = 'quick'
foxcolor = ['b', 'r', 'o', 'w', 'n']
println "The $foxtype ${foxcolor.join()} fox"
// => The quick brown fox
```

GStrings are not evaluated until toString() is called. You probably want to call .toString() before adding GStrings to a collection, or else comparisons may fail unexpected. GString and String are NOT equal.

http://mrhaki.blogspot.com/2009/08/groovy-goodness-string-strings-strings.html
http://groovy.jmiguel.eu/groovy.codehaus.org/Strings+and+GString.html

```
def x = 1
def gs = "x = ${x}" // GString created, reference to value of `x` stored, lazily evaluated
assert gs == 'x = 1'
x = 2
assert gs == 'x = 2' // fails

// The following works though
def x = 1
def gs = "x = ${-> x}"
assert gs == 'x = 1'

x = 2
assert gs == 'x = 2'
```
http://groovy-lang.org/closures.html#_closures_in_gstrings


### Groovy Arrays (Lists)
See http://mrhaki.blogspot.com/2009/09/groovy-goodness-working-with-arrays.html.
```
// Java
String[] s = new String[] { "a", "b" };

// Groovy
String[] s = ["a", "b"] as String[]
// or
def s = ["a", "b"]
```


### Default access/visibility modifier is public
* http://groovy-lang.org/style-guide.html#_public_by_defaulth
* http://groovy.codehaus.org/Groovy+style+and+language+feature+guidelines+for+Java+developers.


### Groovy shell
Shell variables are all UNtyped (no `def` or type info)
```
// sets a shell variable
foo = "bar"

// evaluates a local variable that will NOT be saved to shell's environment
def foo = "bar"
```
http://www.groovy-lang.org/groovysh.html


### Start Groovy shell
```
groovysh
// To exit, enter
:exit

// set preference
:set interpreterMode

// clear preferences, reset to defaults
:purge preferences
```


### Closures

Closures can have default values:
```
def closureWithTwoArgAndDefaultValue = { int a, int b=2 -> a+b }
assert closureWithTwoArgAndDefaultValue(1) == 3
```
http://groovy-lang.org/closures.html

Restrict closure to calls without arguments:
```
def magicNumber = { -> 42 }

// this call will fail because the closure doesn't accept any argument
magicNumber(11)
```

Closures can have variable number of arguments:
```
def concat1 = { String... args -> args.join('') }           
assert concat1('abc','def') == 'abcdef'                     
def concat2 = { String[] args -> args.join('') }            
assert concat2('abc', 'def') == 'abcdef'  // you don't have to explicitly wrap in array!

def multiConcat = { int n, String... args ->                
    args.join('')*n
}
assert multiConcat(2, 'abc','def') == 'abcdefabcdef'
```

`this` inside closure refers to instance object of enclosing class.

Owner of a closure is the direct enclosing class instance or closure.
```
class NestedClosures {
    void run() {
        def nestedClosures = {
            def cl = { owner }                               
            cl()
        }
        assert nestedClosures() == nestedClosures            
    }
}
```

Delegate of a closure is by default the owner. Can get the delegate using `getDelegate()` or `delegate`. Default delegate is the owner. When a variable is accessed within a closure, the variable is resolved from the delegate. The delegation strategy can be configured. The default is `Closure.OWNER_FIRST`, where references are resolved from the owner first, and if not, then the delegate. Other methods:

* `Closure.DELEGATE_FIRST` - resolve from delegate first, then owner
* `Closure.OWNER_ONLY`
* `Closure.DELEGATE_ONLY`
* `Closure.TO_SELF` - closure class itself -- only makes sense if you subclass Closure

```
class Person {
    String name
    def pretty = { "My name is $name" }             
    String toString() {
        pretty()
    }
}
class Thing {
    String name                                     
}

def p = new Person(name: 'Sarah')
def t = new Thing(name: 'Teapot')

assert p.toString() == 'My name is Sarah'           
p.pretty.delegate = t                               
assert p.toString() == 'My name is Sarah'
p.pretty.resolveStrategy = Closure.DELEGATE_FIRST
assert p.toString() == 'My name is Teapot'
```

Type coercion:
```
interface Predicate<T> {
    boolean accept(T obj)
}

abstract class Greeter {
    abstract String getName()
    void greet() {
        println "Hello, $name"
    }
}

Predicate filter = { it.contains 'G' } as Predicate
assert filter.accept('Groovy') == true

Greeter greeter = { 'Groovy' } as Greeter
greeter.greet()

// `as Type` is optional since Groovy 2.2.0
Predicate filter = { it.contains 'G' }
assert filter.accept('Groovy') == true

Greeter greeter = { 'Groovy' }
greeter.greet()
```
http://docs.groovy-lang.org/latest/html/documentation/core-semantics.html#closure-coercion


### Closure Composition
```
// reverse composition
 def times2 = { a -> a * 2 }
 def add3 = { a -> a + 3 }
 def addThenTimes = times2 << add3
 // equivalent: addThenTimes = { a -> times2(add3(a)) }
 assert addThenTimes(3) == 12

// forward composition
 def times2 = { a -> a * 2 }
 def add3 = { a -> a + 3 }
 def timesThenAdd = times2 >> add3
 // equivalent: timesThenAdd = { a -> add3(times2(a)) }
 assert timesThenAdd(3) == 9
```
http://groovy-lang.org/closures.html#_composition
http://docs.groovy-lang.org/latest/html/api/groovy/lang/Closure.html#leftShift-groovy.lang.Closure-
http://docs.groovy-lang.org/latest/html/api/groovy/lang/Closure.html#rightShift-groovy.lang.Closure-


### Trampoline Closures

Groovy's version of tail recursion.
```
def factorial
factorial = { int n, def accu = 1G ->
    if (n < 2) return accu
    factorial.trampoline(n - 1, n * accu)
}
factorial = factorial.trampoline()  // wrap in TrampolineClosure

assert factorial(1)    == 1
assert factorial(3)    == 1 * 2 * 3
assert factorial(1000) // == 402387260.. plus another 2560 digits
```
The way it works is invoking TrampolineClosure will invoke original closure. If result is another TrampolineClosure, that gets called again, until a non-TrampolineClosure result is returned.

http://mrhaki.blogspot.com/2011/04/groovy-goodness-recursion-with-closure.html
http://groovy-lang.org/closures.html#_trampoline


### Method Pointers
```
boolean doFilter(String s) { s.contains('G') }

Predicate filter = this.&doFilter
assert filter.accept('Groovy') == true

Greeter greeter = GroovySystem.&getVersion
greeter.greet()
```
http://docs.groovy-lang.org/latest/html/documentation/core-semantics.html#closure-coercion
http://docs.groovy-lang.org/latest/html/documentation/core-operators.html#method-pointer-operator

Method pointer operator returns a Closure. Can be used anywhere a Closure can be used.


### `it` default named parameter
See http://groovy.codehaus.org/Quick+Start --> Working with closures.
```
def closure = { println "hello " + it }
closure.call("world!")
```

### Groovy Regular Expressions
See http://groovy.codehaus.org/Regular+Expressions.
```
def matcher = "cheesecheese" =~ /cheese/
assert matcher instanceof Matcher

// Matcher defines an iterator() method, so it can be used, for example,
// with collect() and each():
matcher = "cheese please" =~ /([^e]+)e+/
matcher.each { println it }
matcher.reset()
assert matcher.collect { it } == [["chee", "ch"], ["se", "s"], [" ple", " pl"], ["ase", "as"]]
```

### Elvis operator (?:)
See http://groovy.codehaus.org/Operators#Operators-ElvisOperator(?:)
def displayName = user.name ? user.name : "Anonymous" //traditional ternary operator usage
def displayName = user.name ?: "Anonymous"  // more compact Elvis operator - does same as above

### Map literal (associative array)
```
def map = [name: 'Gromit', likes: 'cheese', id: 1234]
// keys are strings by default

// http://groovy-lang.org/groovy-dev-kit.html#_map_property_notation
map.name
```
http://www.groovy-lang.org/groovy-dev-kit.html#_map_literals


### `withDefault`: Map default values
```
final Map<String, Set<String>> myMap = [:].withDefault { new HashSet<>() }
```
http://mrhaki.blogspot.com/2010/07/groovy-goodness-map-with-default-values.html

### Read/write string to file
```
// Read file into string
// http://stackoverflow.com/questions/7729302/how-to-read-a-file-in-groovy-into-a-string
String fileContents = new File('/path/to/file').text


// Write string to file
// http://groovy.329449.n5.nabble.com/Writing-a-string-to-a-file-td330117.html
new File('test').write('hello')
```

### Spread Operator `*.`
http://docs.groovy-lang.org/latest/html/documentation/index.html#_spread_operator
```
class Car {
    String make
    String model
}
def cars = [
       new Car(make: 'Peugeot', model: '508'),
       new Car(make: 'Renault', model: 'Clio')]
def makes = cars*.make
assert makes == ['Peugeot', 'Renault']
```

### `@Field` Annotation
Changes variable scope from run method to class level.
```
import groovy.transform.Field

@Field List awe = [1, 2, 3]
def awesum() { awe.sum() }
assert awesum() == 6
```

### Direct field access operator `.@`
http://docs.groovy-lang.org/latest/html/documentation/#_direct_field_access_operator
```
class User {
    public final String name
    User(String name) { this.name = name}
    String getName() { "Name: $name" }
}
def user = new User('Bob')
assert user.name == 'Name: Bob'
assert user.@name == 'Bob'
```

### Tokenize
```
String  testString='hello world'

// tokenize() ignores empty strings
assert ['hel',' world']==testString.split('lo')

// The tokenize() method uses each character of a String as delimiter
assert ['he',' w','r','d']==testString.tokenize('lo')
```
http://www.tothenew.com/blog/groovy-tokenize-vs-split/


### Multiline Strings
```
def a = """
    test
    test
    test
""".stripIndent()
```
http://stackoverflow.com/a/5079914/1128392


### With Method
```
class Sample {
    String username
    String email
    List<String> labels = []
    def speakUp() { "I am $username" }
    def addLabel(value) { labels << value }
}

def sample = new Sample()
sample.with {
    username = 'mrhaki'
    email = 'email@host.com'
    println speakUp()  // Output: I am mrhaki
    addLabel 'Groovy'
    addLabel 'Java'
}

def sb = new StringBuilder()
sb.with {
    append 'Just another way to add '
    append 'strings to the StringBuilder '
    append 'object.'
}
```
http://mrhaki.blogspot.com/2009/09/groovy-goodness-with-method.html