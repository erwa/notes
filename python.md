### Global Variables
Reading from global variable does not require any special modifiers. To write to a global variable from a function, add
```
global <var_name>
```
at the beginning of the function.

### Read file line by line
See http://stackoverflow.com/questions/3277503/python-read-file-line-by-line-into-array.
```
# Gets rid of the newline
lines = [line.rstrip('\n') for line in open('filename')]
```

# Read input arguments
# http://stackoverflow.com/questions/983201/python-and-sys-argv
import sys
if len(sys.argv) > 1:
  ...

# Split string by whitespace
# http://stackoverflow.com/questions/8113782/split-string-on-whitespace-in-python
# str.split() splits on whitespace by default
# Or you can use re
import re
re.split('\s+', <string>)

# Remove last character from string
# http://stackoverflow.com/questions/15478127/remove-final-character-from-string-python
'abcdefghij'[:-1]

# Write to stderr
# http://stackoverflow.com/questions/5574702/how-to-print-to-stderr-in-python
sys.stderr.write()

# Add a module import path
# http://stackoverflow.com/questions/10531359/how-do-i-add-a-python-import-path-permanently
sys.path.append("/path/to/directory")

# Convert list/array to string
# http://stackoverflow.com/questions/5618878/how-to-convert-list-to-string
list1 = ['1', '2', '3']
str1 = ''.join(list1) # 123
list1 = [1, 2, 3]
str1 = ''.join(str(e) for e in list1) # 123

# Check if list is empty
# http://stackoverflow.com/questions/53513/best-way-to-check-if-a-list-is-empty
a = []
if not a:
  print "List is empty"

# Python slicing and finding the last index of a character
output_dir[:output_dir.rfind('/')]

# Check if path is directory
# https://docs.python.org/2/library/os.path.html#os.path.isdir
os.path.isdir(path)

# List files in directory
# https://docs.python.org/2/library/os.html#os.listdir
os.listdir(<path>)

# Using regular expressions
# http://stackoverflow.com/questions/4666973/how-to-extract-a-substring-from-inside-a-string-in-python
import re
text = 'gfgfdAAA1234ZZZuijjk'
m = re.search('AAA(.+?)ZZZ', text)
if m:
    found = m.group(1) # found: 1234

# __init__.py file used to make Python treat directory as package
# https://docs.python.org/2/tutorial/modules.html#packages

# __str__ vs. __repr__
# http://stackoverflow.com/questions/1436703/difference-between-str-and-repr-in-python
# __repr__ is unambiguous representation, __str__ is human-readable representation
# if __repr__ defined and __str__ undefined, then __str__ = __repr__
str(x)
repr(x)

# *args and **kwargs
# http://stackoverflow.com/questions/3394835/args-and-kwargs
# *args = list of args as positional arguments
# **kwargs = list of named args as dictionary

# Iterate over dictionary
for key in d:
for k,v in d.iteritems():

# Sort a dictionary in descending order
sorted_d = sorted(d.items(), key=lambda x: x[1], reverse=True)

### Docstrings
See https://www.python.org/dev/peps/pep-0257/#what-is-a-docstring.
> A docstring is a string literal that occurs as the first statement in a module, function, class, or method definition. Such a docstring becomes the __doc__ special attribute of that object.