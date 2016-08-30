This file is about working with .so library files.


### Find location of library
```
ldconfig -p | grep libssl.so.10
```
http://serverfault.com/questions/54736/how-to-check-if-a-library-is-installed


### Print default linker search path
```
ldconfig -v 2>/dev/null | grep -v ^$'\t'
```
http://stackoverflow.com/questions/9922949/how-to-print-the-ldlinker-search-path


### Print symbol table in library file
```
nm /path/to/lib.so

# dynamic symbols
nm -D /path/to/lib.so
```