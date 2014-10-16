# open most recent file in a directory
vim `ls -t | head -1`

# yank entire file
:%y

# vim count number of occurrences of pattern
:%s/pattern//gn

# substitution with prompt
:%s/old/new/gc

# vim show special characters
:set list

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

# Change casing of a character
~

# Insert literal tab when expand tab is on
Ctrl+v, Tab
