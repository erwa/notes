### Scroll up

```
Ctrl-A, Esc to switch to scroll mode
Page Up/Down or Up/Down to scroll
Esc to exit
```

https://smallbusiness.chron.com/scroll-up-linux-screen-46302.html


### Create a named screen `foo`

```
screen -S foo
```

http://stackoverflow.com/questions/3202111/how-to-assign-name-for-a-screen


### Check if in screen session

```
echo $STY
# "" means no screen session. Else screen session.
```

http://serverfault.com/questions/257975/how-to-check-if-im-in-screen-session


### Attach to another session (detach it and then reattach)

```
screen -d -r SESSION
```

http://stackoverflow.com/questions/20807696/how-do-i-force-detach-screen-from-another-ssh-session


### Show sessions

```
screen -ls
```


### Detach Screen session

```
Ctrl + a, d
```


### Reattach Screen session

```
screen -r

screen -r <session>
```


### Kill session

```
# -X sends a command
# -S SESSION specifies the session
screen -X -S SESSION quit
```