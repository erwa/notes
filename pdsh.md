Run command pipeline on remote hosts:
```
pdsh -Rexec -w ^hosts bash -c "echo 'hi' | grep h"
```