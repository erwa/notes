### Example script

Automate `git rebase -i HEAD~2`.

```
#!/usr/bin/env expect
spawn git rebase -i HEAD~2

# down, delete word, insert 's' (for squash), Escape, save and quit
send "jdwis \033:wq\r"

expect "# This is a"

# down 4, delete 3 lines, save and quit
send "4j3d:wq\r"

interact
```