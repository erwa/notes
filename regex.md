### Named capture group

```
(?<name>group)
```

https://www.regular-expressions.info/named.html


### Non-capturing group

```
(?:foobar)
```

https://stackoverflow.com/questions/3512471/what-is-a-non-capturing-group-what-does-do


### Non-greedy

`?`

Example:

`<img\s.*?>`

https://stackoverflow.com/questions/11898998/how-can-i-write-a-regex-which-matches-non-greedy


### Metacharacters inside character classes

Usually only `]`, `\`, `^`, and `-`.

https://www.regular-expressions.info/charclass.html


### Escaping hyphens

Only needed when not the first or last character in character class

```
[-a-z]
[0-9-]
[a-z\-0-9]
```

http://stackoverflow.com/questions/9589074/regex-should-hyphens-be-escaped


### Word characters

```
# does NOT include - (hyphen)
[A-Za-z0-9_]
```

http://www.regular-expressions.info/shorthand.html


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


### Positive Lookahead, Negative Lookahead, Positive Lookbehind, and Negative Lookbehind

http://www.regular-expressions.info/lookaround.html

```
# positive lookahead
# q followed by u
q(?=u)

# Find and replace used for making sure my .md files have a blank line after lines starting with ###:
# Make sure to enable regex matching mode
Find: ###(.*)$\n(?=[^\n])
Replace: ###$1\n\n


# negative lookahead
# q not followed by u
q(?!u)

# positive lookbehind
(?<=a)b
# matches the b (and only the b) in "cab", but does not match "bed" or "debt".

# negative lookbehind
(?<!a)b
# matches a "b" that is not preceded by an "a", using negative lookbehind.
# It doesn't match cab, but matches the b (and only the b) in bed or debt.
```