### .PHONY

Phony targets are those that are not actually files. For example, a "clean" command. It can also be used to force a target to always run (e.g.: always recompile).

https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html


### Curly brackets variable expansion

Make uses `/bin/sh` by default. Need to change `SHELL` to `bash`.

```
SHELL=/bin/bash
```

https://stackoverflow.com/questions/12838278/using-curly-brackets-for-variable-expansion-in-makefile-doesnt-work


### `$(@D)`

The directory part of the file name of a target, with trailing slash removed.

https://stackoverflow.com/questions/42646316/what-does-d-mean-in-shell-script