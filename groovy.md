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
See http://groovy.codehaus.org/Groovy+style+and+language+feature+guidelines+for+Java+developers.

### Start Groovy shell
```
groovysh
// To exit, enter
:exit
```

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

### Map literal
```
def map = [name: 'Gromit', likes: 'cheese', id: 1234]
// keys are strings by default
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