### Scala singletons
For every Scala singleton object, the compiler will create a Java class for the object with a dollar sign added to the end.
* http://stackoverflow.com/questions/5721046/singletons-as-synthetic-classes-in-scala

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