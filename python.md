### Get environment variable
```
import os
print os.environ['HOME']
```
http://stackoverflow.com/questions/4906977/how-to-access-environment-variables-from-python


### Get path and directory of current file
```
os.path.realpath(__file__)

os.path.dirname(os.path.realpath(__file__))
```
http://stackoverflow.com/questions/50499/how-do-i-get-the-path-and-name-of-the-file-that-is-currently-executing
http://stackoverflow.com/questions/5137497/find-current-directory-and-files-directory


### Class variables / static variables
```
class Test(object):
    i = 3 # class (or static) variable
    @classmethod
    def g(cls, arg):
        # here we can use 'cls' instead of the class name (Test)
        if arg > cls.i:
            cls.i = arg # would the the same as  Test.i = arg1
```
http://stackoverflow.com/questions/68645/static-class-variables-in-python


### Add set to another set
```
set1.update(set2)
```


### Regex match anywhere in string
```
match = re.search('CREATE TABLE ([a-z.]+)', contents)
print match.group(1)
```
https://docs.python.org/2/library/re.html#re.search


### Untar
```
import tarfile
tar = tarfile.open("sample.tar.gz")
tar.extractall()
tar.close()
```
http://stackoverflow.com/questions/8893359/untar-archive-in-python-with-errors


#### Untar in memory
```
from StringIO import StringIO

import tarfile
import urllib

handle = urllib.urlopen('http://host/foo.tgz')

tarfile = tarfile.open(fileobj=StringIO(handle.read()))
print tarfile.extractfile('file_inside_tgz').read()
```
http://stackoverflow.com/a/4204690/1128392
http://stackoverflow.com/questions/8858414/using-python-how-do-you-untar-purely-in-memory


### `defaultdict`
```
d = defaultdict(int)
for k in s:
    d[k] += 1

# Create defaultdict with initial values
d = defaultdict(int, {'a': 1, 'b': 2})
```
http://stackoverflow.com/questions/5900578/how-does-collections-defaultdict-work


### Run background process
```
import subprocess
subprocess.Popen(["rm","-r","some.file"])

# subprocess.Popen() only runs a process in the background if nothing
# in the python script depends on the output of the command being run
```
http://stackoverflow.com/a/7224186/1128392


### Parallel commands
```
import multiprocessing as mp
import time

pool = mp.Pool(3)
results = pool.map(time.sleep, [4, 6, 8])
```
http://stackoverflow.com/a/12097555/1128392


### Write to file or stdout
```
output = open(file, 'w') if file else sys.stdout

output.write(...)

if output is not sys.stdout:
    output.close()
```


### Write to file
```
with open('somefile.txt', 'w') as the_file:
    the_file.write('Hello\n')
```
http://stackoverflow.com/a/6160082/1128392


### Zip files
```
import shutil
shutil.make_archive(output_filename, 'zip', dir_name)
```
http://stackoverflow.com/questions/1855095/how-to-create-a-zip-archive-of-a-directory


### Global Variables
Reading from global variable does not require any special modifiers. To write to a global variable from a function, add
```
global <var_name>
```
at the beginning of the function.

### Read file line by line
```
# Stream file line by line
with open(...) as f:
    for line in f:
        <do something with line>
# http://stackoverflow.com/questions/8009882/how-to-read-large-file-line-by-line-in-python

# Read into an array
# Gets rid of the newline
lines = [line.rstrip('\n') for line in open('filename')]
# http://stackoverflow.com/questions/3277503/python-read-file-line-by-line-into-array
```

# Read input arguments
# http://stackoverflow.com/questions/983201/python-and-sys-argv
import sys
if len(sys.argv) > 1:
  ...


### Split string into two variables
```
firstName, lastName = myString.split()
```
http://stackoverflow.com/a/6670331/1128392


### Split string by whitespace
```
# str.split() splits on whitespace by default
>>> "many   fancy word \nhello    \thi".split()
['many', 'fancy', 'word', 'hello', 'hi']

# Or you can use re
import re
re.split('\s+', <string>)
```
http://stackoverflow.com/questions/8113782/split-string-on-whitespace-in-python


# Remove last character from string
# http://stackoverflow.com/questions/15478127/remove-final-character-from-string-python
'abcdefghij'[:-1]

# Write to stderr
# http://stackoverflow.com/questions/5574702/how-to-print-to-stderr-in-python
sys.stderr.write()

### Add a module import path
```
sys.path.append("/path/to/directory")
```
http://stackoverflow.com/questions/10531359/how-do-i-add-a-python-import-path-permanently


### Concat lists
```
list1 + list2
```
http://stackoverflow.com/questions/4344017/how-can-i-get-the-concatenation-of-two-lists-in-python-without-modifying-either


### Append to list
```
list.append(x)
```
http://www.tutorialspoint.com/python/list_append.htm

### Convert list/array to string
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

### Dictionaries

```
# Check if key in dictionary
if key in d:
# http://stackoverflow.com/questions/1602934/check-if-a-given-key-already-exists-in-a-dictionary

# Iterate over dictionary
for key in d:
for k,v in d.iteritems():

# Sort a dictionary in descending order
sorted_d = sorted(d.items(), key=lambda x: x[1], reverse=True)

# Delete from dictionary while iterating
for k in mydict.keys():
    if k == 'two':
        del mydict[k]
# http://stackoverflow.com/questions/5384914/how-to-delete-items-from-a-dictionary-while-iterating-over-it
```

### Docstrings
See https://www.python.org/dev/peps/pep-0257/#what-is-a-docstring.
> A docstring is a string literal that occurs as the first statement in a module, function, class, or method definition. Such a docstring becomes the __doc__ special attribute of that object.

### Convert letter to int and back
http://stackoverflow.com/questions/227459/ascii-value-of-a-character-in-python
```
>>> ord('a')
97
>>> chr(97)
'a'
>>> chr(ord('a') + 3)
'd'
>>>
```

### Built-in exceptions

https://docs.python.org/2/library/exceptions.html


### try except else
https://docs.python.org/2/tutorial/errors.html#handling-exceptions

```
for arg in sys.argv[1:]:
    try:
        f = open(arg, 'r')
    except IOError:
        print 'cannot open', arg
    else:
        print arg, 'has', len(f.readlines()), 'lines'
        f.close()
```

`else` clause must follow all `except` clauses and will be executed if the `try` block does not throw an exception.

### raise exception
`raise` by itself re-raises the thrown exception.

### Pytest
Test discovery: http://pytest.org/latest/goodpractises.html#test-discovery
* Looks for `test_*.py` and `*_test.py` files, among other things.
* Within a test file, runs `test_` prefixed functions and methods.

### Debugger
```
python -m pdb myscript.py

# Set breakpoint in file.py at line 38
b /path/to/file.py:38

# Set breakpoint at line 19 of current file
b 19

# Continue until breakpoint
c

# Print args of current function
a

# Print a variable
print VARIABLE_NAME
# You can execute arbitrary Python

# Next line
n

# Quit
q
```
https://docs.python.org/2/library/pdb.html

### Exit with error code
```
import sys
sys.exit(1)
```

### Disable output buffering
```
python -u foo.py
```
http://stackoverflow.com/questions/107705/disable-output-buffering

### Redirect output
http://stackoverflow.com/questions/4675728/redirect-stdout-to-a-file-in-python
```
import sys
sys.stdout = open('file', 'w')
print 'test'
```

```
$ python foo.py > file
```

### mkdir
```
os.mkdir(path)
```
http://www.tutorialspoint.com/python/os_mkdir.htm

### Delete file or folder
```
# Remove a file
if os.path.isfile(path):
    os.remove(path)

# remove an empty directory
os.rmdir()

# delete a directory and all its contents
shutil.rmtree(path[, ignore_errors=False])
# https://docs.python.org/2/library/shutil.html#shutil.rmtree
```
http://stackoverflow.com/questions/6996603/how-do-i-delete-a-file-or-folder-in-python

### Delete if not exists
```
try:
    os.remove(filename)
except OSError:
    pass
```
http://stackoverflow.com/questions/10840533/most-pythonic-way-to-delete-a-file-which-may-not-exist

### Run external command
```
from subprocess import call
call(["ls", "-l"])
```
http://stackoverflow.com/questions/89228/calling-an-external-command-in-python


### Run external command and capture output
```
import subprocess
output = subprocess.Popen(["cat", "temp"], stdout=subprocess.PIPE).communicate()[0]
```
http://stackoverflow.com/a/4760517/1128392


### Print current working directory
```
os.getcwd()
```
http://stackoverflow.com/questions/5137497/find-current-directory-and-files-directory


### Multiline comments

Use triple-quoted strings.

http://stackoverflow.com/questions/7696924/multiline-comments-in-python


### Trim string
```
s.strip()
```
http://stackoverflow.com/questions/1185524/how-to-trim-whitespace-including-tabs