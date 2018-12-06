This file is about working with .so library files.


### Update SONAME

```
patchelf --set-soname new_so_name.so my_lib.so
```

https://stackoverflow.com/questions/18467163/is-there-any-way-to-change-the-soname-of-a-binary-directly


### Show symbols in a library

```
objdump -T /path/to/foo.so | grep GLIBC
```

https://stackoverflow.com/questions/42433530/lib64-libc-so-6-version-glibc-2-14-not-found


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
# -p prints the cache
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

https://stackoverflow.com/questions/34732/how-do-i-list-the-symbols-in-a-so-file