### Negative Lookbehind
http://www.regular-expressions.info/lookaround.html
```
(?<!a)b
# matches a "b" that is not preceded by an "a", using negative lookbehind.
# It doesn't match cab, but matches the b (and only the b) in bed or debt.
```