### Using pthread

Compile using `gcc -pthread ...`.

https://stackoverflow.com/questions/1662909/undefined-reference-to-pthread-create-in-linux


### Unsigned overflow vs. signed overflow

Unsigned overflow is defined by the C standard while signed overflow is not. Most likely because only one obvious unsigned representation while multiple signed representations.

https://stackoverflow.com/questions/18195715/why-is-unsigned-integer-overflow-defined-behavior-but-signed-integer-overflow-is/18195756


### Wait and notify

Use `pthread_cond_wait` and `pthread_cond_signal` or `pthread_cond_broadcast`.

https://stackoverflow.com/questions/2085511/wait-and-notify-in-c-c-shared-memory


### String split

Use `strtok`.

Note that strtok modifies the input string!

https://wiki.sei.cmu.edu/confluence/display/c/STR06-C.+Do+not+assume+that+strtok%28%29+leaves+the+parse+string+unchanged


### String index of, index of character

```
// strstr
char * source = "test string";         /* assume source address is */
                                       /* 0x10 for example */
char * found = strstr( source, "in" ); /* should return 0x18 */
if (found != NULL) {                   /* strstr returns NULL if item not found */
  int index = found - source;          /* index is 8 */
                                       /* source[8] gets you "i" */
}

// strchr
char *pos = strchr (myString, '#');
int pos = pos ? pos - myString : -1;
```

https://stackoverflow.com/questions/4824/string-indexof-function-in-c


### String concatenation

```
strcat(s1, s2);
```

https://stackoverflow.com/questions/8465006/how-do-i-concatenate-two-strings-in-c/8465083


### String starts with

```
strncmp(pre, str, strlen(pre)) == 0
```

https://stackoverflow.com/questions/4770985/how-to-check-if-a-string-starts-with-another-string-in-c


### String equals

```
strcmp(check, input) != 0
```

https://stackoverflow.com/questions/8004237/how-do-i-properly-compare-strings


### printf bool

```
bool x = true;
printf("%d\n", x); // prints 1
```

https://stackoverflow.com/questions/17307275/what-is-the-printf-format-specifier-for-bool


### offsetof

Returns offset (in bytes) of element within a struct.

```
offsetof(my_struct, elem_in_struct)
```

https://en.wikipedia.org/wiki/Offsetof


### Signed short to unsigned int

Sign extend, then reinterpret.

https://stackoverflow.com/questions/19262851/what-is-the-rule-for-c-to-cast-between-short-and-int


### Generate assembly

```
# generates foo.s
gcc -S foo.c
```

https://stackoverflow.com/questions/137038/how-do-you-get-assembler-output-from-c-c-source-in-gcc


### Static function

Only visible in the scope of the file it is define in.

```
static void staticFunc(void)
{
  printf("Inside the static function staticFunc() ");
}
```

https://www.tutorialspoint.com/static-functions-in-c


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

Unsigned integer type. On 64-bit machines, should be unsigned long long (8 bytes).

https://www.geeksforgeeks.org/size_t-data-type-c-language/
https://stackoverflow.com/questions/2550774/what-is-size-t-in-c

Print size_t

```
size_t x = ...;
ssize_t y = ...;
printf("%zu\n", x);  // prints as unsigned decimal
printf("%zx\n", x);  // prints as hex
printf("%zd\n", y);  // prints as signed decimal
```

https://stackoverflow.com/questions/2524611/how-can-one-print-a-size-t-variable-portably-using-the-printf-family


### Goto statement

```
goto label;
...
label:
...
```

https://www.geeksforgeeks.org/goto-statement-in-c-cpp/


### Signal Handling

Use sigaction(). signal() seems unreliable.

```
static void install_sigpipe_handler() {
    struct sigaction action;
    sigset_t block_mask;
    sigemptyset(&block_mask);

    action.sa_handler = sigpipe_handler;
    action.sa_mask = block_mask;
    action.sa_flags = SA_RESTART; /* Restart syscalls if possible */

    if (sigaction(SIGPIPE, &action, NULL) < 0) {
        sio_fprintf(STDERR_FILENO, "Signal error\n");
        _exit(1);
    }
}
```


### Signals

2 = SIGINT (ctrl-c)

http://www.yolinux.com/TUTORIALS/C++Signals.html


### struct

If you pass struct as argument, all its contents will be copied. Not a reference unless argument is `struct *`.

A struct in a function is a local copy.

https://stackoverflow.com/questions/161788/are-there-any-downsides-to-passing-structs-by-value-in-c-rather-than-passing-a


### Variable scope

Enclosing brackets. So variables declared inside if blocks disappear after you leave the block.

https://stackoverflow.com/questions/8543167/scope-of-variables-in-if-statements


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

`%f` - double
`%lx` - long as hex
`%p` - pointer address
`%x` - unsigned hex integer

https://stackoverflow.com/questions/4264127/correct-format-specifier-for-double-in-printf
http://www.cplusplus.com/reference/cstdio/printf/


### typedef

```
typedef int Length;

typedef struct foo_node node;
struct foo_node {
    node *next;
    node *prev;
};
```

They are private to the file (and any files that include the file). You cannot have a "static" typedef.

https://stackoverflow.com/questions/12444611/using-static-on-typedef-struct


### sizeof

```
sizeof unary-expression
sizeof ( type-name )
```

https://stackoverflow.com/questions/5894892/why-and-when-do-i-need-to-use-parentheses-after-sizeof


### Read file line-by-line, line by line

```
#include <stdio.h>
int main ( void ) {
  static const char filename[] = "file.txt";
  FILE *file = fopen ( filename, "r" );
  if ( file != NULL ) {
    char line [ 128 ]; /* or other suitable maximum line size */
    while ( fgets ( line, sizeof line, file ) != NULL ) { /* read a line */
      fputs ( line, stdout ); /* write the line */
    }
    fclose ( file );
  } else {
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
