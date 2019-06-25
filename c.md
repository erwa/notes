### %. (.precision)

Precision specifies minimum number of digits to be printed, zero-padded.

```
unsigned u = 0x40b8bu;
char arr[10];
sprintf(arr, "%.8x", u);
```

```
$ gcc test.c && ./a.out
0040b8bu
```

https://www.tutorialspoint.com/c_standard_library/c_function_printf.htm


### size_t

Unsigned integer type.

https://stackoverflow.com/questions/2550774/what-is-size-t-in-c


### Goto statement

```
goto label;
...
label:
...
```

https://www.geeksforgeeks.org/goto-statement-in-c-cpp/


### Signals

2 = SIGINT (ctrl-c)

http://www.yolinux.com/TUTORIALS/C++Signals.html


### strcat

```
char *strcat(char *dest, const char *src)
```

Requires `dest` to have enough space for src to be appended. Seems to need one more than the final string length in order to write the `\0` character.

https://www.tutorialspoint.com/c_standard_library/c_function_strcat.htm


### Start new process

`fork()`

http://www.csl.mtu.edu/cs4411.ck/www/NOTES/process/fork/create.html


### Start new thread

`pthread_create`

http://timmurphy.org/2010/05/04/pthreads-in-c-a-minimal-working-example/
https://stackoverflow.com/questions/56810/how-do-i-start-threads-in-plain-c