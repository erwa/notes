### List packages or delete packages

Preferences -> Package Control -> List Packages, Delete Package


### Copy file path

Right click somewhere in file (NOT file tab) --> copy file path

https://stackoverflow.com/questions/29743615/how-to-easily-get-current-file-path-in-sublime-text-3


### Delete trailing whitespace on save

```
"trim_trailing_white_space_on_save": true
```

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