# open most recent file in a directory
vim `ls -t | head -1`

# yank entire file
:%y

# vim count number of occurrences of pattern
:%s/pattern//gn

# replace all occurrences of pattern
:%s/old/new/g

# substitution with prompt
:%s/old/new/gc

# vim show special characters
:set list

# Search for current word
*

# vim turn off search highlighting
:set nohlsearch

# multiple windows
# http://www.cs.oberlin.edu/~kuperman/help/vim/windows.html
 :e filename      - edit another file
 :split filename  - split window and load another file
 ctrl-w up arrow  - move cursor up a window
 ctrl-w ctrl-w    - move cursor to another window (cycle)
 ctrl-w_          - maximize current window
 ctrl-w=          - make all equal size
 :vsplit file     - vertical split
 10 ctrl-w >      - increase vertical window size by 10 characters

 10 ctrl-w+       - increase horizontal window size by 10 lines

 :sview file      - same as split, but readonly
 :hide            - close current window
 :only            - keep only this window open
 :ls              - show current buffers
 :b 2             - open buffer #2 in this window

 # Jump to matching parenthesis/bracket/brace
 %

# Insert control character
Ctrl + v + <character>

# Change casing of a character / Lowercase/uppercase current character
See http://vim.wikia.com/wiki/Switching_case_of_characters.
~

# Insert literal tab when expand tab is on
Ctrl+v, Tab

# Move screen without moving cursor
# http://stackoverflow.com/questions/3458689/how-to-move-screen-without-moving-cursor-in-vim
Ctrl+e # Move screen up
Ctrl+y # Move screen down
zz # Center cursor
zt # Move cursor line to top
zb # Move cursor line to bottom

# vim command-line (:) navigation
# http://stackoverflow.com/questions/2075569/how-can-i-move-around-in-the-vim-command-line
Ctrl+b # jump to beginning of line
Ctrl+e # jump to end of line

### Turn word wrap on/off
```
set wrap
set nowrap
```

Lower/upper-case word: http://stackoverflow.com/questions/2285255/how-to-change-letters-in-a-word-from-upper-case-to-lower-case-or-the-other-way-a
```
# Lowercase word
guiw

# Uppercase word
gUiw
```

Global command
See http://vim.wikia.com/wiki/Power_of_g.
```
:[RANGE]g/PATTERN/COMMAND
```

Delete all lines matching pattern
```
:g/PATTERN/d
```

Delete lines M to N, inclusive
:M,Nd