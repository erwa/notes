### Covariance, Contravariance, and Invariance
https://twitter.github.io/scala_school/type-basics.html#variance

* In most cases, you need an X, and you have a subclass of X, you're fine (covariance).
* For function arguments, if you need an X, and you pass it a subclass of X, you're in trouble when someone class it with a different subclass of X. In this case, you want contravariance.
* Invariance means two types are unrelated.