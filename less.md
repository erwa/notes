### Start reading from 50.2% in
Seems to be fastest way of jumping to a specific time in a file.
```
less -n +50.2p foo.log
```
http://serverfault.com/questions/411280/how-to-get-less-to-seek-faster-with-large-log-files


### Open a large file
```
less <file>
```
For a long line, press `<right-arrow>` to show more of the line.

To highlight/unhighlight search results, type `<Esc, u>`.


### Move N windows forward/backward
```
10f - 10 windows forward
10b - 10 windows backward
```
http://ss64.com/bash/less.html


### Scroll N lines forward/backward
```
10j – 10 lines forward.
10k – 10 lines backward.
```
http://www.thegeekstuff.com/2010/02/unix-less-command-10-tips-for-effective-navigation/


### Turn word wrap on/off in less
See http://superuser.com/questions/272818/how-to-turn-off-word-wrap-in-less
```
-, Shift-S
```


### Open file at line number
```
less +320123 filename
```
http://stackoverflow.com/questions/8586648/going-to-a-specific-line-number-using-less-in-unix


### Jump to line number
See http://stackoverflow.com/questions/8586648/going-to-a-specific-line-number-using-less-in-unix
```
ng # jump to line `n`
-N # turn line numbers on/off
```

### Search forward
```
/pattern
```

### Search backward
```
?pattern
```