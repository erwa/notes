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