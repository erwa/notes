### Collect backtraces for multiple processes

```
ps -ef | grep PATTERN | tr -s ' ' | cut -d ' ' -f 2 | \
  xargs -I{} gdb -p {} --batch -ex=bt > backtraces
```


### Restart

r  # run


### Print stack trace / stacktrace

```
where
```


### Compile with debugging info

Use `-g`.

https://www.geeksforgeeks.org/gdb-command-in-linux-with-examples/


### Set breakpoint

```
# at line number
b <file_name>:<line_number

b foo.c:123

# at function
b MyFunction
```

http://web.eecs.umich.edu/~sugih/pointers/gdbQS.html


### Run multiple commands

Must define function.

```
(gdb) define fn
> finish
> next  # step over line (does not enter function calls)
> end
```

https://unix.stackexchange.com/questions/297982/how-to-step-into-step-over-and-step-out-with-gdb
https://stackoverflow.com/questions/1262639/multiple-commands-in-gdb-separated-by-some-sort-of-delimiter


### One operand multiplication

imul edx
fmul edx

Implicitly multiplies with eax.

https://stackoverflow.com/questions/3818755/imul-assembly-instruction-one-operand


### Examine word stored at address

```
x/g $rsp  # examine 8-byte word starting at address $rsp

x/wx 0xf7bd3040  # examine 4-byte word at address
p/x *0xf7bd3040

x/gx $rsp+0x28  # examine 8-byte word at $rsp+0x28, print as hex

x/48b $rsp  # print 48 bytes from $rsp onward
```

https://sourceware.org/gdb/current/onlinedocs/gdb/Memory.html


### Print contents of array | print array

```
p/x array[index]

# array is array variable
# length is length of array
p *array@length

p/x *roots@6
```

https://sourceware.org/gdb/current/onlinedocs/gdb/Arrays.html


### Print string at address

```
print (char*) $esi
```


### Print next 10 instructions

```
x/10i $pc
```

https://stackoverflow.com/questions/1902901/show-current-assembly-instruction-in-gdb


### Print first 10 instructions of function

```
x/10i my_function
```

https://stackoverflow.com/questions/10874298/gdb-disassemble-one-line


### Step into function

```
s  # will step into function if line is function call
```

http://web.eecs.umich.edu/~sugih/pointers/gdbQS.html


### Step out of function

```
fin
```

https://stackoverflow.com/questions/24712690/step-out-of-current-function-with-gdb


### Check meaning of command

```
# help FOO
help n
```


### Show breakpoints

```
i b
```


### Print integer at address

```
print *(int *) ($rsp)
```


### Print string / print char*

```
print (char*) $rbp
```


### Print multiple variables

```
print {var1, var2, ...}
```

https://stackoverflow.com/questions/1882857/print-multiple-variables-with-one-command-in-gdb


### Print multiple registers

```
print /x {$rbx, $rbp}
```

https://stackoverflow.com/questions/1882857/print-multiple-variables-with-one-command-in-gdb


### FLAGS register

IF = interrupt flag

https://en.wikipedia.org/wiki/FLAGS_register


### Print all registers and flags

```
i r
```


### Setting breakpoints

```
b *0x0000000000401417  // set breakpoint at address 0x401417
b FOO  // set breakpoint at function FOO
```


### Disassemble function

disas = disassemble current function
disas FOO = diassemble function FOO