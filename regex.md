### Modifiers
```
(?s)  // single line mode, dot (.) matches all characters, including line breaks
```
http://www.regular-expressions.info/modifiers.html


### Optional Pattern
```
colou?r # matches color and colour

Nov(ember)? # matches Nov and November
```
http://www.regular-expressions.info/optional.html


### Positive Lookbehind and Negative Lookbehind
http://www.regular-expressions.info/lookaround.html#lookbehind
```
# positive lookbehind
(?<=a)b
# matches the b (and only the b) in "cab", but does not match "bed" or "debt".

# negative lookbehind
(?<!a)b
# matches a "b" that is not preceded by an "a", using negative lookbehind.
# It doesn't match cab, but matches the b (and only the b) in bed or debt.
```