This file is about working with .so library files.


### List shared libraries

```
ldd /path/to/foo.so
```

https://stackoverflow.com/questions/50159/how-to-show-all-shared-libraries-used-by-executables-in-linux


### Find location of library

```
# Option 1
$ whereis libffi
libffi: /usr/lib64/libffi.so

# Option 2
ldconfig -p | grep libssl.so.10
```

https://unix.stackexchange.com/questions/194088/how-to-check-if-a-shared-library-is-installed
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