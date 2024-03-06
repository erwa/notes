### Increase refresh frequency

`d`, then input new refresh frequency.

https://www.baeldung.com/linux/top-command


### Show full command

Press 'c' while top is running.

https://serverfault.com/questions/139632/show-full-process-name-in-top


### Memory columns

`VIRT` is virtual memory.
`RES` is physical memory currently consuming.
`SHR` is sharable part of virtual memory (e.g.: libraries)

http://mugurel.sumanariu.ro/linux/the-difference-among-virt-res-and-shr-in-top-output/


### Using top

http://alvinalexander.com/linux/unix-linux-top-command-cpu-memory


### Sort by memory

```
# interactive mode
M (capital M)
# http://man7.org/linux/man-pages/man1/top.1.html

top -a

# OSX
o, type MEM, Enter

o, n, Enter
```


### Show CPU percentage as percentage of all CPUs

By default, %CPU is percentage of single CPU. To show as percentage of all CPUs, `Shift + I`.

https://askubuntu.com/questions/707203/top-command-on-ubuntu-multicore-cpu-shows-cpu-usage-100


### Sort by CPU

```
top -o %CPU
# https://unix.stackexchange.com/questions/158584/change-tops-sorting-back-to-cpu

# interactive mode
P (capital P)
# http://man7.org/linux/man-pages/man1/top.1.html

o, k, Enter
```


### Help

`h`