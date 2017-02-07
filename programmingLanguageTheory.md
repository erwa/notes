### Covariance, Contravariance, and Invariance

#### In Java

Arrays are covariant. They are reifiable, meaning at runtime, the JVM knows what the underlying implementation is.

Generics are not reifiable. At compile-time, the type is erased, so at runtime, the JVM does not know what the underlying implementation is.

https://dzone.com/articles/covariance-and-contravariance


#### In Scala

https://twitter.github.io/scala_school/type-basics.html#variance

* In most cases, you need an X, and you have a subclass of X, you're fine (covariance).
* For function arguments, if you need an X, and you pass it a subclass of X, you're in trouble when someone class it with a different subclass of X. In this case, you want contravariance.
* Invariance means two types are unrelated.