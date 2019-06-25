### ret

Implicitly pops address from stack and jumps to that address.


### shr

Logical shift right. (Fill in with 0s regardless of sign bit.)

https://en.wikibooks.org/wiki/X86_Assembly/Shift_and_Rotate#Logical_Shift_Instructions


### sar with one operand

```
sar $rax
```

Signed divide by 2, 1 time.

https://c9x.me/x86/html/file_module_x86_id_285.html


### Stack addresses

Usually in the 0x7fffffff range.


### Register sizes

rax = 8 bytes
eax = 4 bytes
ax = 2 bytes
ah = 1 byte (upper byte of ax)
al = 1 byte (lower byte of ax)


### Operand size

Can often be inferred by register sizes.

https://stackoverflow.com/questions/44577130/when-should-i-use-size-directives-in-x86


### movl

Moves long (4 bytes) and zeroes out the high-order bits (upper 4 bytes).

https://stackoverflow.com/questions/11177137/why-do-x86-64-instructions-on-32-bit-registers-zero-the-upper-part-of-the-full-6


### movzbl

Move from byte (8-bit) to long (32-bit) and zero-extend.

https://stackoverflow.com/questions/9317922/what-does-the-movzbl-instruction-do-in-ia-32-att-syntax


### movslq

Move and sign-extend from long (32-bit) source to quad (64-bit) dest.

https://stackoverflow.com/questions/55584797/what-does-movslq-do


### q, l, w, b

q = quad = 64 bits
l = long = 32 bits
w = word = 16 bits
b = byte = 8 bites

Should match the size of the registers being used.

http://www.hep.wisc.edu/~pinghc/x86AssmTutorial.htm