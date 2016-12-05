### Class Instantiation
```
val invoice = Invoice()
val customer = Customer("Joe Smith")
```
https://kotlinlang.org/docs/reference/classes.html


### Reflection

Print type of variable
```
val min = listOf(1,2).min()!!

println(min.javaClass.name)                 // int
println(min.javaClass.kotlin)               // class kotlin.Int
println(min.javaClass.kotlin.qualifiedName) // kotlin.Int
```
http://stackoverflow.com/questions/32684739/kotlin-get-type-as-string


### Ranges
```
if (i in 1..10) { // equivalent of 1 <= i && i <= 10
  println(i)
}

for (i in 1..4) print(i) // prints "1234"
# or
(1..4).forEach { i -> print(i) }

for (i in 4..1) print(i) // prints nothing

for (i in 4 downTo 1) print(i) // prints "4321"
```
https://kotlinlang.org/docs/reference/ranges.html


### Data Class
A class that only holds data
```
data class User(val name: String, val age: Int)

val jack = User(name = "Jack", age = 1)
val olderJack = jack.copy(age = 2)
```
https://kotlinlang.org/docs/reference/data-classes.html

Can use to return multiple values from a function:
```
data class Result(val result: Int, val status: Status)
fun function(...): Result {
    // computations
    
    return Result(result, status)
}

// Now, to use this function:
val (result, status) = function(...)
```
https://kotlinlang.org/docs/reference/multi-declarations.html#example-returning-two-values-from-a-function



### Extension Methods

Kotlin supports extension methods.

https://kotlinlang.org/docs/reference/extensions.html

```
// Add `swap` method to `MutableList<Int>`
fun MutableList<Int>.swap(index1: Int, index2: Int) {
  val tmp = this[index1] // 'this' corresponds to the list
  this[index1] = this[index2]
  this[index2] = tmp
}
```


### Splitting empty string
`"".split()` will return empty array, not an array with one elemtn.


### Style Guide / Coding Conventions
* 4-space indentation

http://kotlinlang.org/docs/reference/coding-conventions.html


### Read-only vs. Mutable Variables
```
# assign-once (read-only)
val b = 1

# mutable
var x = 5
x += 1
```
https://kotlinlang.org/docs/reference/basic-syntax.html#defining-local-variables


### Exceptions

Raise exception:
```
throw IllegalStateException("Uh-oh!")
```

try-catch:
```
try {
  // some code
}
catch (e: SomeException) {
  // handler
}
finally {
  // optional finally block
}
```
https://kotlinlang.org/docs/reference/exceptions.html


### Collections
```
// withIndex
list.withIndex() // returns iterator of IndexedValues
                 // elem.index, elem.value
```
https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/with-index.html


### Pair
```
val p = Pair(1, "a")
val (a, b) = p  // decompose pair
assert(1 == a)
assert("a".equals(b))
```
https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/-pair/index.html



### partition function
Splits array in two lists, first containing elements that pass predicate, second containing elements that fail predicate.
```
val (x, y) = transientTestFailures.partition { test ->
  val v = testToFailureCount[test]!!
  v <= testRetryCount
```
https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/partition.html


### Null safety

NPE (NullPointerException) will not happen as often.

https://kotlinlang.org/docs/reference/null-safety.html

Null Coalescing (a.k.a. Elvis Operator)
```
b?.length  # returns length or null (type Int?)

val l = b?.length ?: -1
```

To allow NPE, use `!!` (or else the compiler will complain):
```
val l: Int = b!!.length

// Can also use to auto-convert from nullable type (T?) to non-nullable type (T).
val min: Int = listOf(1, 2).min()!!
// http://stackoverflow.com/questions/34342413/what-is-the-kotlin-double-bang
```




### Generic Method
```
fun <T> singletonList(item: T): List<T> {
  // ...
}

val l = singletonList<Int>(1)
```
https://kotlinlang.org/docs/reference/generics.html


### Compile and run
```
kotlinc test.kt  # generates TestKt.class

kotlinc test.kt -include-runtime -d test.jar
java -jar test.jar

# one line
kotlinc test.kt -include-runtime -d test.jar && java -jar test.jar
```


### List literal
```
val names1 = listOf("Joe","Ben","Thomas")
```
http://stackoverflow.com/questions/36262305/difference-between-list-and-array-types-in-kotlin


### String Templates

```
"$firstName $lastName"

"${person.name} is ${1 * 2}"
```
https://gist.github.com/dodyg/5823184