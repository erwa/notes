### Two's complement

Non-negative numbers are same as binary representation.

For negative numbers, they are the two's complement of their absolute value. To get the two's complement of a number, take the one's complement and add 1. E.g.: -1 -> 1 -> 11111110 -> 11111111.


### Monad

A concept in functional programming related to wrapping a type and performing computations inside a context. Think Maybe X or X opt or Option(X).

A monad consists of

* a type constructor (data Maybe T = Just T or Nothing)
* a type converter, often called "unit" or "return" that embeds an object in a monad. Example: unit(x): T -> Maybe T
* a combinator, typically "bind": (mx >>= f) : (M T, T -> M U) -> M U

It also must obey some laws:

* unit(a) >>= λx → f(x) ↔ f(a)
* ma >>= λx → unit(x) ↔ ma
* ma >>= λx → (f(x) >>= λy → g(y)) ↔ (ma >>= λx → f(x)) >>= λy → g(y)

https://en.wikipedia.org/wiki/Monad_(functional_programming)


### Covariance

"Read-only data types (sources) can be covariant; write-only data types (sinks) can be contravariant. Mutable data types which act as both sources and sinks should be invariant."

http://en.wikipedia.org/wiki/Covariance_and_contravariance_(computer_science)
