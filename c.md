### No argument function

```
f(void)

f() // can take any number of arguments
```

https://softwareengineering.stackexchange.com/questions/286490/what-is-the-difference-between-function-and-functionvoid/287002


### Variable number of arguments / varargs

```
void Error(const char* format, ...)
{
    va_list argptr;
    va_start(argptr, format);
    vfprintf(stderr, format, argptr);
    va_end(argptr);
}
```

https://stackoverflow.com/questions/1056411/how-to-pass-variable-number-of-arguments-to-printf-sprintf


### Nested macros

```
#define FOO abcd

#define MACRO1(FOO, x) FOO##_##x
// Won't work
#define MACRO2(x) MACRO1(FOO, x)

// This combination will
#define MACRO3(FOO, x) MACRO1(FOO, x)
#define MACRO4(x) MACRO3(FOO, x)


MACRO1(xyz, x) // xyz_x
MACRO2(jkl) // FOO_jkl
MACRO4(x) // abcd_x
```

https://stackoverflow.com/questions/30113944/how-to-write-a-macro-that-will-append-text-to-a-partial-function-name-to-create


### Use statement or declaration in expression

```
# using if block as expression
# wrap compound expression in braces
# wrap that in parentheses
int i = ({int j; if (true) j = 1; else j = 2; j;});
```

https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html


### Barriers

```
#include <pthread.h>

pthread_barrier_t barrier;
...
pthread_barrier_init(&barrier, NULL, nThreads);
...
pthread_barrier_wait(&barrier);
```

https://docs.oracle.com/cd/E19253-01/816-5137/gfwek/index.html


### Disable GCC compiler optimizations

Pass `-O0` as a flag to GCC.

https://stackoverflow.com/questions/5765899/how-to-disable-compiler-optimizations-in-gcc


### Generate random double between 0 and 1

```
#include <stdlib.h>

(double)rand() / RAND_MAX
```

https://stackoverflow.com/questions/33058848/generate-a-random-double-between-1-and-1


### Where are gcc header files

```
`gcc -print-prog-name=cpp` -v
```

https://stackoverflow.com/questions/344317/where-does-gcc-look-for-c-and-c-header-files


### Include quotes vs. angle brackets

`#include <filename>` searches in implementation-dependent manner. Usually used to include standard library header files.

`#include "filename"` searches in the same directory as file containing include, and then does search that `#include <filename>` does.

https://stackoverflow.com/questions/21593/what-is-the-difference-between-include-filename-and-include-filename


### Doxygen

`@brief` description should end with period. Add empty line between it and extended description to avoid having the extended description included in the brief.

Ignore file.

```
# configure in doxygen.conf
EXCLUDE = dir/ path/to/file.txt
```

https://stackoverflow.com/questions/34776315/doxygen-special-command-to-ignore-a-file


### NaN, infinity, negative infinity

```
double NAN = 0.0/0.0;
double POS_INF = 1.0 /0.0;
double NEG_INF = -1.0/0.0;
```

https://stackoverflow.com/questions/1923837/how-to-use-nan-and-inf-in-c


### Substring

Use `strncpy` or `memcpy`.

https://stackoverflow.com/questions/10530064/how-to-use-substring-function-in-c/10530098


### Suppress warnings inline

```
#pragma GCC diagnostic ignored "-Wuninitialized"
    foo(b);         /* no diagnostic for this one */
#pragma GCC diagnostic pop
```

https://stackoverflow.com/questions/3378560/how-to-disable-gcc-warnings-for-a-few-lines-of-code


### Cast to function pointer

```
(void (*)(void *))SGENT_1_calc

// more readable alternative
typedef void sigrout_t(void*);
((sigrout_t*) SGENT_1_calc) (someptr);
```

https://stackoverflow.com/questions/15807333/cast-to-function-pointer


### Casting to void / cast to void

Used to suppress compiler warnings about unused variables.

```
int x;
(void) x;
```

https://stackoverflow.com/questions/34288844/what-does-casting-to-void-really-do


### Operator precedence

1) struct member access, array subscripting (left-to-right)
2) casting (right-to-left)
3) +/- (addition) (left-to-right)

https://en.cppreference.com/w/c/language/operator_precedence


### Using pthread

Compile using `gcc -pthread ...`.

https://stackoverflow.com/questions/1662909/undefined-reference-to-pthread-create-in-linux


### Unsigned overflow vs. signed overflow

Unsigned overflow is defined by the C standard while signed overflow is not. Most likely because only one obvious unsigned representation while multiple signed representations.

https://stackoverflow.com/questions/18195715/why-is-unsigned-integer-overflow-defined-behavior-but-signed-integer-overflow-is/18195756


### Wait and notify

Use `pthread_cond_wait` and `pthread_cond_signal` or `pthread_cond_broadcast`.

https://stackoverflow.com/questions/2085511/wait-and-notify-in-c-c-shared-memory


### Multiline string

```
// multiple string literals are concatenated
char* my_str =
  "Here is the first line."
  "Here is the second line.";
```

https://jameshfisher.com/2016/11/30/c-multiline-literal/


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
#include <stdbool.h>

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


### Inline assembly

Output and input operands are 0-indexed, starting with output operands and continuing with input operands.

```
int x = 1;
printf("%d\n", x);
asm("addl $1, %1"
    : "=r" (x)     // = means overwrites, r for register operand
    : "ir" (x));   // i for integer operand, r for register operand
printf("%d\n", x);

int *y = &x;
printf("%d\n", *y);
asm("addl $1, (%0)"
    :
    : "ir" (y));
printf("%d\n", *y);


// This code copies src to dst and add 1 to dst.
int src = 1;
int dst;

asm ("mov %1, %0\n\t"
    "add $1, %0"
    : "=r" (dst)
    : "r" (src));

printf("%d\n", dst);

// inline assembly to save %ds to variable
uint32_t x = 0;
asm("push %%ds; pop %0"
    : "=r" (x)
    :);
```

https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Extended-Asm
https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#OutputOperands
https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html

```
asm("movl $0xffff000,4(%ebp)");
```

https://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-C
https://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html


### Generate assembly

```
# generates foo.s
gcc -S foo.c
```

https://stackoverflow.com/questions/137038/how-do-you-get-assembler-output-from-c-c-source-in-gcc


### Static initialization

```
static bool initialized = false;

__attribute__((constructor))
static void initialize(void) {
    initialized = true;
    // do some other initialization
}

int main(int argc, char **argv) {
    // initialize will have been run before main started
    return 0;
}
```

https://stackoverflow.com/questions/10678607/possible-to-initialize-static-variable-by-calling-function


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


### Acceptable use of goto

```
int foo(int bar)
{
    int return_value = 0;
    if (!do_something( bar )) {
        goto error_1;
    }
    if (!init_stuff( bar )) {
        goto error_2;
    }
    if (!prepare_stuff( bar )) {
        goto error_3;
    }
    return_value = do_the_thing( bar );
error_3:
    cleanup_3();
error_2:
    cleanup_2();
error_1:
    cleanup_1();
    return return_value;
}
```

https://stackoverflow.com/questions/788903/valid-use-of-goto-for-error-management-in-c


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


### Octal char literal

```
\60  // octal for '0'
```

http://www.asciitable.com/


### printf format

`%f` - double
`%lx` - print long in hex
`%ld` - print long in decimal
`%o` - octal integer
`%p` - pointer address
`%x` - unsigned hex integer

https://stackoverflow.com/questions/38561/what-is-the-argument-for-printf-that-formats-a-long
https://www.lix.polytechnique.fr/~liberti/public/computing/prog/c/C/FUNCTIONS/format.html
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


### Convert FILE pointer to file descriptor

```
#include <stdio.h>

int fileno(FILE *stream)
```

https://stackoverflow.com/questions/3167298/how-can-i-convert-a-file-pointer-file-fp-to-a-file-descriptor-int-fd


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
