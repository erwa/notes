### Examples
```
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