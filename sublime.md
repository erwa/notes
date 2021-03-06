### Switch to other panel / change panel

Ctrl + 1/2/3

https://superuser.com/questions/368785/switch-between-columns-active-tabs-in-sublime-text-2


### Show file in sidebar / reveal in sidebar

Right click inside file -> Reveal in Side Bar

https://forum.sublimetext.com/t/shortcut-for-reveal-in-side-bar/36372
https://julianhigman.com/2013/07/23/sublime-text-3-keyboard-shortcut-to-reveal-file-in-sidebar/


### Change casing

C-K, C-U or C-K, C-L

https://www.nobledesktop.com/blog/change-text-case-in-sublime-text


### Move line up

Ctrl + Cmd + up/down

http://docs.sublimetext.info/en/latest/reference/keyboard_shortcuts_osx.html


### List packages or delete packages

Preferences -> Package Control -> List Packages, Delete Package


### Copy file path

Right click somewhere in file (NOT file tab) --> copy file path

https://stackoverflow.com/questions/29743615/how-to-easily-get-current-file-path-in-sublime-text-3


### Delete trailing whitespace on save

```
"trim_trailing_white_space_on_save": true
```

https://blog.revathskumar.com/2012/08/sublimetext-remove-tailing-spaces-on-file-save.html
http://nategood.com/sublime-text-strip-whitespace-save


### Multi-cursor

One per line: select block -> Cmd + Shift + L

http://stackoverflow.com/questions/12520214/select-all-and-multiple-cursors-using-sublimetext2


### Delete duplicate lines

Edit -> Permute Lines -> Unique

https://forum.sublimetext.com/t/is-there-a-way-to-sort-and-or-remove-duplicate-lines/3102


### Sort lines

F5 (Edit -> Sort Lines)


### Show whitespace

Temporarily: search by regex

Other methods: http://stackoverflow.com/questions/10153998/sublime-text-2-view-whitespace-characters


### Language-specific indentation settings

See http://mlo.io/blog/2012/08/23/language-specific-indents-sublime.html. Sublime Text 2 -> Preferences -> Settings - More -> Syntax Specific - User

```
{
    "tab_size": 4
}
```

Close and restart Sublime.


### Pasting verbatim (without converting tabs to spaces)

View -> Indentation -> Uncheck "Indent Using Spaces" before pasting


### Jump to matching brace

Ctrl + M


### Delete a line

```
Ctrl + Shift + K
Ctrl + D // Works only on an empty line
```