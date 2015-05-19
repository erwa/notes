### GStrings
See http://groovy.codehaus.org/Strings+and+GString.
```
foxtype = 'quick'
foxcolor = ['b', 'r', 'o', 'w', 'n']
println "The $foxtype ${foxcolor.join()} fox"
// => The quick brown fox
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

### Map keys are strings by default
[a: 1] is equivalent to ["a": 1]

### Read/write string to file
```
// Read file into string
// http://stackoverflow.com/questions/7729302/how-to-read-a-file-in-groovy-into-a-string
String fileContents = new File('/path/to/file').text


// Write string to file
// http://groovy.329449.n5.nabble.com/Writing-a-string-to-a-file-td330117.html
new File('test').write('hello')
```