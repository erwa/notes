### Complexity theory

https://en.wikipedia.org/wiki/NP-hardness#NP-naming_convention

NP problems are those where solutions can be verified in polynomial time.

NP-hard problems are at least as hard as the hardest problems in NP, but may not be in NP.

NP-complete problems are in NP and contain the hardest problems in NP.

General traveling salesman problem is NP-hard. Problem of finding a path <= length L is NP-complete.

General bin packing problem (finding minimum number of bins) is NP-hard. But deciding if the objects will fit in N bins is NP-complete.


### Quickselect

O(n) average case because you're dividing input in half on average each time and only recursing on one side.
n + n/2 + n/4 + ... = 2n = O(n)