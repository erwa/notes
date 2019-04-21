### `rcmd: socket: Permission denied`

```
PDSH_RCMD_TYPE=ssh pdsh ...
```

https://serverfault.com/questions/544917/pdsh-gives-error-rcmd-socket-permission-denied


### `dshbak`

```
# 2>/dev/null is useful for ignoring errors
pdsh -g my_group <command> 2>/dev/null | dshbak -c
```

dshbak aggregates identical output, just prints a list of nodes with matching output in header block.


### Examples

```
pdsh -w foo[7515-7525,7527-7539,7787-7809] ...

# Run on hosts foo1, foo2, foo3, and foo10
# ssh -o StrictHostKeyChecking=no is needed the first time to overcome
#   "Host key verification failed."
pdsh -w foo[1-3,10] -R exec ssh -o StrictHostKeyChecking=no %h hostname
# http://askubuntu.com/questions/45679/ssh-connection-problem-with-host-key-verification-failed-error
# Subsequently, you can just run
pdsh -w foo[1-3,10] hostname

# Multiple hosts
pdsh -w foo,bar ...

pdsh -Rexec -w ^hosts bash -c "echo 'hi' | grep h"

pdsh -g NETGROUP_NAME COMMAND ARGS
pdsh -g NETGROUP_NAME readlink -f /export/apps/hive/current
```

https://linux.die.net/man/1/pdsh