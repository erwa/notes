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


### struct

If you pass struct as argument, all its contents will be copied. Not a reference unless argument is `struct *`.

A struct in a function is a local copy.

https://stackoverflow.com/questions/161788/are-there-any-downsides-to-passing-structs-by-value-in-c-rather-than-passing-a


### Variable initialization

Global variables initialized to 0 automatically.

```
int a; // is set to 0

void foo() {
  int b;  // set to whatever happens to be in memory there
}
```

https://stackoverflow.com/questions/7975008/initializing-variables-in-c


### sscanf

Ignore data read (don't store in variable):

```
sscanf(line, " %c %lx,%*d", &c, &address);
```

https://www.tutorialspoint.com/c_standard_library/c_function_sscanf.htm


### printf format

`%lx` - long as hex
`%p` - pointer address
`%x` - unsigned hex integer

http://www.cplusplus.com/reference/cstdio/printf/


### typedef

```
typedef int Length;
```


### sizeof

```
sizeof unary-expression
sizeof ( type-name )
```

https://stackoverflow.com/questions/5894892/why-and-when-do-i-need-to-use-parentheses-after-sizeof


### Read file line-by-line, line by line

```
#include <stdio.h>
int main ( void )
{
   static const char filename[] = "file.txt";
   FILE *file = fopen ( filename, "r" );
   if ( file != NULL )
   {
      char line [ 128 ]; /* or other suitable maximum line size */
      while ( fgets ( line, sizeof line, file ) != NULL ) /* read a line */
      {
         fputs ( line, stdout ); /* write the line */
      }
      fclose ( file );
   }
   else
   {
      perror ( filename ); /* why didn't the file open? */
   }
   return 0;
}
```

https://www.daniweb.com/programming/software-development/code/216411/reading-a-file-line-by-line


### atoi

```
int val = atoi(str);
```

https://www.tutorialspoint.com/c_standard_library/c_function_atoi.htm


### getopt

```
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main (int argc, char **argv)
{
  int aflag = 0;
  int bflag = 0;
  char *cvalue = NULL;
  int index;
  int c;

  opterr = 0;

  while ((c = getopt (argc, argv, "abc:")) != -1)
    switch (c)
      {
      case 'a':
        aflag = 1;
        break;
      case 'b':
        bflag = 1;
        break;
      case 'c':
        cvalue = optarg;
        break;
      case '?':
        if (optopt == 'c')
          fprintf (stderr, "Option -%c requires an argument.\n", optopt);
        else if (isprint (optopt))
          fprintf (stderr, "Unknown option `-%c'.\n", optopt);
        else
          fprintf (stderr,
                   "Unknown option character `\\x%x'.\n",
                   optopt);
        return 1;
      default:
        abort ();
      }

  printf ("aflag = %d, bflag = %d, cvalue = %s\n",
          aflag, bflag, cvalue);

  for (index = optind; index < argc; index++)
    printf ("Non-option argument %s\n", argv[index]);
  return 0;
}
```

https://www.gnu.org/software/libc/manual/html_node/Example-of-Getopt.html


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
