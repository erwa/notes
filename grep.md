### Show line number
```
grep -n
```


### Treat binary file as text file
```
grep -a ...
```


### Only show line following match
```
# works if following line does not contain the pattern
grep -A1 'blah' | grep -v 'blah'
```


### Remove `--` separator
```
grep ... | grep -v "^--$"
```
http://stackoverflow.com/questions/2168065/how-do-i-get-rid-of-line-separator-when-using-grep-with-context-lines


### Grep multiple files
```
grep PATTERN file1 file2
```


### Grep only files matching a pattern:
```
grep --include=*.job -r "type=hive" ./*
```

### Grep and only show matching files:
```
grep -l
```
* http://stackoverflow.com/questions/3908156/grep-output-to-show-only-matching-file

### Grep for classes with "Test" in their names. See http://www.robelle.com/smugbook/regexpr.html.
```
grep Test.*class
```
NOTE: `grep Test*.class` and `grep Test*class` do NOT work as expected.

Grep for files ending in .xml:
```
grep "\.xml"
```

Grep for items that do NOT match a pattern:
```
grep -v <pattern>
```

Grep starting from certain line number:
```
sed -n '<line_number>,$ p' <file> | grep <pattern>
```

Grep, cut, and sed:
```
grep pattern FILE | cut -d '"' -f 4 | sed -e 's/://' | sed -e 's/\.git//'
```

Grep and only print the second field:
```
grep -r "pattern" ./* | cut -d ' ' -f 2
```
`-d ' '` means split on space. `-f 2` means select only the 2nd field.

Grep, split on whitespace, and print fifth field:
```
grep "pattern" | awk '{print $5}'
```


```
# Match the beginning of lines
grep '^<pattern>'

# Don't show file name
grep -h

# Show matching part only
grep -o

# Trim whitespace (technically will leave one leading space)
grep ... | tr -s [:space:]
```

Grep number of occurrences of WORD in FILE
```
grep -o WORD FILE | wc -l
```
`-o` causes grep to only print matching part (not entire line)

Grep and ignore errors
```
grep -s ...
```

Grep and hide filename
```
grep -h
```

Grep and show lines before and after
```
grep -B 1 -A 1
```
http://stackoverflow.com/questions/9081/grep-a-file-but-show-several-surrounding-lines

Grep for full word
```
grep -w WORD
# http://stackoverflow.com/questions/2879085/how-to-grep-for-the-whole-word
```