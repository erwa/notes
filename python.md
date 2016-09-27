### Sets
```
s = set()
s.add(x)
s.pop()
s.remove(x)
```
https://docs.python.org/2/library/sets.html


### pytest Exceptions
```
def test_zero_division():
    with pytest.raises(ZeroDivisionError):
        1 / 0
```


### Parameterize tests
```
import pytest

@pytest.mark.parametrize('name, left, right', [['foo', 'a', 'a'],
                                               ['bar', 'a', 'b'],
                                               ['baz', 'b', 'b']])
def test_me(name, left, right):
    assert left == right, name
```

Run using `py.test`.

http://stackoverflow.com/a/25626660/1128392


### Running using virtual environment in IntelliJ

http://stackoverflow.com/questions/20877106/using-intellijidea-within-an-existing-virtualenv


### unittest

```
import unittest

class TestMyClass(unittest.TestCase):

    # Setup method called once per class
    # Use this rather than __init__
    def setUp():
        ...
```
https://docs.python.org/2/library/unittest.html#unittest.TestCase.setUp


### Get type of object
```
type(obj)
```
http://stackoverflow.com/questions/402504/how-to-determine-the-variable-type-in-python


### Parse map from string
```
import ast
a = ast.literal_eval('{0:1,1:3,6:8}')
print a
print a[0]
print a[6]
```
http://stackoverflow.com/questions/988228/converting-a-string-to-dictionary


### Wait for keypress from user
```
while True:
    try:
        raw_input()
    except EOFError:  # terminate on Ctrl+D
        sys.exit()
```
http://stackoverflow.com/questions/17650754/how-can-i-capture-ctrl-d-in-python-interactive-console


### Connect to MySQL
```
#!/usr/bin/env python

import MySQLdb

import getpass
pw = getpass.getpass()

db = MySQLdb.connect(host="foo.example.com",
                     user="user",
                     passwd=pw,
                     db="database")

cur = db.cursor()
cur.execute("desc DUMMY_TABLE;")
for row in cur.fetchall():
    print row

db.close()
```


### Get function name as string
```
def foo
    pass

foo.__name__
```
http://stackoverflow.com/questions/251464/how-to-get-a-function-name-as-a-string-in-python


### Enable logging in Pytest
```
py.test --capture=no
```


### ArgumentParser
https://docs.python.org/2/library/argparse.html

Optional arguments start with `-`. Positional arguments do not.

Multiline help text:
```
from argparse import RawTextHelpFormatter
parser = ArgumentParser(description='test', formatter_class=RawTextHelpFormatter)
```
http://stackoverflow.com/questions/3853722/python-argparse-how-to-insert-newline-in-the-help-text


### sleep
```
import time
time.sleep(5) # delays for 5 seconds
```
http://stackoverflow.com/questions/510348/how-can-i-make-a-time-delay-in-python


### Expand list to function arguments / unpacking argument lists
```
def foo(x,y,z):
   return "%d, %d, %d" % (x,y,z)

values = [1,2,3]

# the solution.
foo(*values)
```
http://stackoverflow.com/questions/7745952/python-expand-list-to-function-arguments


### Invoke method by name
```
import foo
result = getattr(foo, 'bar')()
```
http://stackoverflow.com/questions/3061/calling-a-function-of-a-module-from-a-string-with-the-functions-name-in-python


### Iterate with index
```
for idx, val in enumerate(ints):
    print(idx, val)
```
http://stackoverflow.com/questions/522563/accessing-the-index-in-python-for-loops


### Convert epoch to datetime
```
import time
time.strftime('%Y-%m-%d %H:%M:%S %Z', time.localtime(1347517370))
```


### Variable Scope
A function introduces a new scope.
```
def foo(a):
    if a:
        b = True
    else:
        b = False

    print b  # b will be either True or False, unlike in Java,
             # where b would not be defined
```
http://stackoverflow.com/questions/291978/short-description-of-python-scoping-rules


### Read password from stdin
```
import getpass
pw = getpass.getpass()
```
http://stackoverflow.com/questions/1761744/read-password-from-stdin


### String endswith
```
s.endswith('foo')
```
http://www.tutorialspoint.com/python/string_endswith.htm


### Variable substitution inside triple strings
```
"""%s is awesome.""" % 'Pizza'
```
http://stackoverflow.com/questions/3877623/in-python-can-you-have-variables-within-triple-quotes-if-so-how


### Pydoc

https://docs.python.org/devguide/documenting.html


### Unicode string comparison
```
u'MyString' == 'MyString'  # True
u'MyString' is 'MyString'  # False
```


### `json.load()` vs. `json.loads()`
* `load()` take a file-like object.
* `loads()` takes a string.
https://www.reddit.com/r/learnpython/comments/3nx9ch/json_load_vs_loads/


### Diff JSON
```
import json
a = json.loads(...)
b = json.loads(...)

a == b
```


### Parse JSON
```
with open('/path/to/file') as f:  # defaults to 'r' mode
    data = json.load(f)

print(json.dumps(data, indent=2))
```

To maintain order, use
```
import json
from collections import OrderedDict

# OrderedDict requires Python 2.7
data = json.loads('{"foo":1, "bar": 2}', object_pairs_hook=OrderedDict)
print json.dumps(data, indent=4)
```
http://stackoverflow.com/questions/6921699/can-i-get-json-to-load-into-an-ordereddict-in-python


### Line breaks
Break before an operator
```
# Yes: easy to match operators with operands
income = (gross_wages
          + taxable_interest
          + (dividends - qualified_dividends)
          - ira_deduction
          - student_loan_interest)
```

https://www.python.org/dev/peps/pep-0008/#should-a-line-break-before-or-after-a-binary-operator


### Class and static methods
First argument to a class method is the class (not an instance). Static method does not take any required arguments.

http://stackoverflow.com/questions/12179271/python-classmethod-and-staticmethod-for-beginner


### Accessing class variables
Assigning to an instance variable (self.foo) named the same as a class variable (Class.foo) will hide the class attribute with an instance attribute with the same name.
```
>>> class RLCN:
...     static_var = 5
...     def method1(self):
...         RLCN.static_var += 1
...     def method2(self):
...         self.static_var += 1
>>> rlcn = RLCN()
>>> RLCN.static_var, rlcn.static_var
(5, 5)
>>> rlcn.static_var
5
>>> rlcn.method1()
>>> RLCN.static_var, rlcn.static_var
(6, 6)
>>> rlcn.method2()
>>> RLCN.static_var, rlcn.static_var
(6, 7)
```
http://stackoverflow.com/questions/25577578/python-access-class-variable-from-instance


### `self` argument
First argument to every instance method, including `__init__`, is a reference to the current instance of the class.

https://pythontips.com/2013/08/07/the-self-variable-in-python-explained/


### Naming conventions
```
_INTERNAL_CLASS_CONSTANT
PUBLIC_CLASS_CONSTANT
_internal_class_variable
public_class_variable
_internal_instance_variable
public_instance_variable

# classses are in modules, which use lowercase_underscore_separated naming
MyClass

# packages (directories) should use lowercasepreferablywithoutunderscores
```
https://google.github.io/styleguide/pyguide.html?showone=Naming#Naming
http://programmers.stackexchange.com/questions/308972/python-file-naming-convention


### Find location library is installed / get file path of imported module
```
import jpype
print jpype.__file__
```
http://stackoverflow.com/questions/269795/how-do-i-find-the-location-of-python-module-sources


### Set environment variable
```
import os
os.environ['FOO'] = 'bar'
```
http://stackoverflow.com/questions/5971635/setting-reading-up-environment-variables-in-python


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
# No inheritance
class MyClass:

    # constructor, initializes class
    def __init__(self, a, b):
        ...

# instantiate a class
x = MyClass()

# extends `object`
class Test(object):
    i = 3 # class (or static) variable
    @classmethod
    def g(cls, arg):
        # here we can use 'cls' instead of the class name (Test)
        if arg > cls.i:
            cls.i = arg # would the the same as  Test.i = arg1
```
http://stackoverflow.com/questions/68645/static-class-variables-in-python

#### Calling other methods within a class
```
class Bag:
    def __init__(self):
        self.data = []

    def add(self, x):
        self.data.append(x)

    def addtwice(self, x):
        self.add(x)
        self.add(x)
```


### Add set to another set
```
set1.update(set2)
```

### String replacement
```
str.replace(old, new[, max])
```
http://www.tutorialspoint.com/python/string_replace.htm


### Regex multiline sub
```
re.sub(re.compile('foo$', re.MULTILINE), 'bar', input_string)
```
http://stackoverflow.com/questions/42581/python-re-sub-multiline-caret-match


### Regex replace
```
# The 'r' prefix tells Python the following is a raw string.
# https://docs.python.org/2/library/re.html
line = re.sub(r'</?\[\d+>', "", line)
```
http://stackoverflow.com/questions/5658369/how-to-input-a-regex-in-string-replace-in-python


### Regex match anywhere in string
```
match = re.search('CREATE TABLE ([a-z._]+)', contents)
print match.group(1)
```
https://docs.python.org/2/library/re.html#re.search

NOTE that `re.match` only matches at the BEGINNING of the string. See https://docs.python.org/2/library/re.html#re.match.


### Untar
```
import tarfile
tar = tarfile.open("sample.tar.gz")
tar.extractall()
tar.close()
```
http://stackoverflow.com/questions/8893359/untar-archive-in-python-with-errors


### Read URL
```
import urllib

link = "http://www.somesite.com/details.pl?urn=2344"
f = urllib.urlopen(link)
myfile = f.read()
print myfile
```
http://stackoverflow.com/questions/15138614/how-can-i-read-the-contents-of-an-url-with-python


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
from collections import defaultdict

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

### Write to and read from other process
```
#!/usr/bin/env python
from subprocess import PIPE, Popen

process = Popen('./test.sh', stdin=PIPE, stdout=PIPE, shell=False, close_fds=True)
process.stdin.write('foobar\n')
out = process.stdout.readline()
print out
process.stdin.write('qux\n')
out = process.stdout.readline()
print out
```

`test.sh`:
```
#!/usr/bin/env bash
while read line
do
  echo "$line"
done < "${1:-/dev/stdin}"
```


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


### Read string line by line
```
for line in textData.splitlines():
    print(line)
```
http://stackoverflow.com/questions/15422144/how-to-read-a-long-multiline-string-line-by-line-in-python


### Read file into string
```
# Option 1
fh = open('foo')
data = fh.read()
fh.close()


# Option 2
with open('data.txt', 'r') as myfile:
    data=myfile.read()

# Option 3: one-liner that does not close the file
data = open("data.txt").read().replace('\n','')
```
http://stackoverflow.com/questions/8369219/how-do-i-read-a-text-file-into-a-string-variable-in-python


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
  # sys.argv[0] = file name
  # sys.argv[1] = first argument
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


### Insert list at beginning of list
```
>>> a = [1,2,3]
>>> a[:0] = [4,5,6]
>>> a
[4, 5, 6, 1, 2, 3]
```


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

# Python slicing and finding the last index (indexof) of a character
output_dir[:output_dir.rfind('/')]

### Check if file exists
```
import os.path
os.path.isfile(fname)
```
http://stackoverflow.com/questions/82831/how-to-check-whether-a-file-exists-using-python


#### Check if path exists and is directory
```
os.path.exists(path) and os.path.isdir(path)
```
http://stackoverflow.com/a/8933290/1128392

#### Change current working directory
```
os.chdir(path)
```
http://stackoverflow.com/questions/1810743/how-to-set-the-current-working-directory-in-python

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
# Only works in Python 2
for k in mydict.keys(): # Creates copy of keys
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
    except IOError as e:
        print 'cannot open', arg
        print e
    else:
        print arg, 'has', len(f.readlines()), 'lines'
        f.close()
```

`else` clause must follow all `except` clauses and will be executed if the `try` block does not throw an exception.

### raise exception / reraise exception
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

# Step into
s

# Step out
r

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

# if not exists and mkdir recursively
if not os.path.exists(directory):
    os.makedirs(directory)
```
http://www.tutorialspoint.com/python/os_mkdir.htm

### Delete file or folder
```
# Remove a file
if os.path.isfile(path):
    os.remove(path)

# remove an empty directory
os.rmdir()

### Delete a directory and all its contents / remove directory
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
exit_status = call(["ls", "-l"])
```
http://stackoverflow.com/questions/89228/calling-an-external-command-in-python


### Run external command and capture output
```
foo = Popen(['command', 'arg1'], stdout=PIPE, stderr=STDOUT).stdout.read()
```

```
import subprocess
process = subprocess.Popen(["cat", "temp"], stdout=subprocess.PIPE)
output = process.communicate()[0]

# returncode is only set after calling communicate(), poll(), or wait()
exit_status = process.returncode

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