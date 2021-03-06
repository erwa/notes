### Tab tearoff and tab merge | splitting tab into a new window

Work in progress: https://github.com/microsoft/terminal/issues/1256


### Split panes

Split vertically: Alt + Shift + +
Split horizontally: Alt + Shift + -
Close pane: Ctrl + Shift + W
Switch pane: Alt + left/right/up/down
Ability to zoom/maximize a pane is slated for 2.0: https://github.com/microsoft/terminal/issues/996
Other pane-related work: https://github.com/microsoft/terminal/issues/1000

https://docs.microsoft.com/en-us/windows/terminal/panes#closing-a-pane
https://www.howtogeek.com/673729/heres-why-the-new-windows-10-terminal-is-amazing/


### Change starting directory

In settings, add

```
{
    "commandline" : "wsl.exe -d Ubuntu",
    "startingDirectory": "//wsl$/Ubuntu/home/erwaman"
}
```

https://goulet.dev/posts/how-to-set-windows-terminal-starting-directory/


### Change default shell

In settings, in the "profiles" section, copy the guid for the shell you want to be the default into the global.defaultProfile field.

https://superuser.com/questions/1456511/is-there-a-way-to-change-the-default-shell-in-windows-terminal