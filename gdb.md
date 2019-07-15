### Set breakpoint at line number

```
b <file_name>:<line_number

b foo.c:123
```

http://web.eecs.umich.edu/~sugih/pointers/gdbQS.html


### Run multiple commands

Must define function.

```
(gdb) define fn
> finish
> next
> end
```

https://stackoverflow.com/questions/1262639/multiple-commands-in-gdb-separated-by-some-sort-of-delimiter


### One operand multiplication

imul edx
fmul edx

Implicitly multiplies with eax.

https://stackoverflow.com/questions/3818755/imul-assembly-instruction-one-operand


### Examine word stored at address

```
x/g $rsp  # examine 8-byte word starting at address $rsp

x/gx $rsp+0x28  # examine 8-byte word at $rsp+0x28, print as hex

x/48b $rsp  # print 48 bytes from $rsp onward
```


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