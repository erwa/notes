### Switch panels

C-w w  # switch in order
C-w h/j/k/l  # switch in direction

https://www.quora.com/How-do-I-switch-between-panes-in-split-mode-in-Vim


### Marks

```
ma  # set mark a
'a  # go to mark a
```

https://vim.fandom.com/wiki/Using_marks


### See column numbers

```
:set ruler
```

https://superuser.com/questions/365320/how-to-show-the-current-column-in-the-statusbar-in-vim


### Recordings

```
qa
# do something
q

# repeat
@a

# repeat 10x
10@a
```


### Change inner (ci)

Delete everything between X and enter insert mode.

```
ci"
ci'
ci(
ci[
ci{
```

https://stackoverflow.com/questions/14650788/why-ci-and-ci-ci-behave-differently


### set^=

```
set runtimepath^=~/.vim/bundle/ctrlp.vim
```

`^=` prepends the value to a comma-separated list, adding the comma if the list is not empty.

http://vimdoc.sourceforge.net/htmldoc/options.html


### ctrlp plugin

Ctrl + P - search folders/files

https://github.com/ctrlpvim/ctrlp.vim

Installation guide: http://ctrlpvim.github.io/ctrlp.vim/#installation


### Run terminal command from vim

```
:! <command>
```


### Show line numbers

```
:set nu
:set number
```


### Quit Vim

```
ZZ  # withOUT typing a colon first
```

https://stackoverflow.com/questions/11828270/how-to-exit-the-vim-editor


### Turn off error highlighting

```
:hi Error NONE
```

https://superuser.com/questions/654919/how-to-turn-off-gvim-error-highlighting


### Delete character under cursor

```
x
```

http://tnerual.eriogerg.free.fr/vimqrc.html


### Comment lines

Go to first line to comment, Ctrl + V, select down to last line, Shift + I, type comment character, press Esc, wait a sec.

http://stackoverflow.com/a/1676690/1128392


### Uncomment lines

Go to first line to uncomment, Ctrl + V, select down to last line, d


### Change color of comments from dark blue to light blue

```
:color desert
```

https://unix.stackexchange.com/questions/88879/better-colors-so-comments-arent-dark-blue-in-vim

```
set background=dark
```

http://stackoverflow.com/questions/2032747/how-to-comment-in-vims-config-files-vimrc


### Set option on start-up

```
vim -c 'set paste'
```

http://vi.stackexchange.com/questions/2973/setting-a-vim-option-from-the-command-line


### Special characters

`^I` is tab character.
`^@` is NUL character.

https://sanctum.geek.nz/arabesque/special-characters-in-vim/
http://unix.stackexchange.com/questions/217010/search-and-replace-control-characters-m-i-in-vi


### Search for special character

```
# search for tab
/\t
```

http://www.linuxask.com/questions/search-for-tab-characters-in-vim


### Enter insert with cursor at different positions

```
I  # cursor at beginning of line
a  # cursor after character
i  # cursor before character
A  # cursor at end of line
```

https://superuser.com/questions/918500/how-to-set-cursor-to-after-last-character-in-vim


### Next word in insert mode

```
Shift + right arrow
```


### Replace mode

```
Shift + R
```
http://stackoverflow.com/questions/9209776/how-to-switch-to-replace-mode-in-vim


### Go to character position in line

```
25|
```

https://stackoverflow.com/questions/4466950/go-to-n-th-symbol-in-line


### Open most recent file in a directory

```
vim `ls -t | head -1`
```


### Yank entire file

```
:%y
```


# vim count number of occurrences of pattern
:%s/pattern//gn

# replace all occurrences of pattern
:%s/old/new/g

# substitution with prompt
:%s/old/new/gc


### Show special characters

```
:set list
```


### Search for current word

```
*
```


### Incremental search (will search and move window after every character)

```
:set incsearch
```


### Turn off search highlighting

```
:set nohlsearch
```


### Multiple Windows

http://www.cs.oberlin.edu/~kuperman/help/vim/windows.html
https://www.linux.com/learn/vim-tips-using-viewports

```
 :e filename      - edit another file
 :split filename  - split window and load another file
 :sp filename     - short version of split filename
 ctrl-w w         - switch to another split window
 ctrl-w up arrow  - move cursor up a window
 ctrl-w ctrl-w    - move cursor to another window (cycle)
 ctrl-w_          - maximize current window
 ctrl-w=          - make all equal size
 :vsplit file     - vertical split
 ctrl-w >         - increase horizontal width by 1 character
 10 ctrl-w >      - increase vertical window size by 10 characters

 10 ctrl-w+       - increase horizontal window size by 10 lines

 :sview file      - same as split, but readonly
 :hide            - close current window
 :only            - keep only this window open
 :ls              - show current buffers
 :b 2             - open buffer #2 in this window
```


### Jump to matching parenthesis/bracket/brace

```
%
```


### Insert control character

```
Ctrl + v + <character>
```


### Change casing of a character / Lowercase/uppercase current character

See http://vim.wikia.com/wiki/Switching_case_of_characters.

```
~
```


### Insert literal tab when expand tab is on

```
Ctrl+v, Tab
```


### Replace tabs with spaces

```
:%s/\t/  /g

# Prompt before each replacement
:%s/\t/  /gc
```


### Keyboard navigation

```
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
0  # move to column 0 of line
Ctrl+e # jump to end of line
```


### Turn word wrap on/off

```
set wrap
set nowrap
```


### Lower/upper-case word: http://stackoverflow.com/questions/2285255/how-to-change-letters-in-a-word-from-upper-case-to-lower-case-or-the-other-way-a

```
# Lowercase word
guiw

# Uppercase word
gUiw
```


### Global command

See http://vim.wikia.com/wiki/Power_of_g.

```
:[RANGE]g/PATTERN/COMMAND
```


### Match whole word

```
\<WORD\>
```

http://vim.wikia.com/wiki/Search_patterns


### Delete all lines matching pattern

```
:g/PATTERN/d
```

Delete lines M to N, inclusive
:M,Nd


### Indentation preferences per file type

Add to `.vimrc`:

```
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
```

http://stackoverflow.com/questions/1562633/setting-vim-whitespace-preferences-by-filetype


### auto-indent

```
set autoindent
set smartindent

" Disables autoindent
set paste

" Renable autoindent
set nopaste
```


### Paste and preserve tabs

```
:set noexpandtab
# Paste
```

http://stackoverflow.com/questions/12584465/how-to-maintain-tabs-when-pasting-in-vim


### Show escape characters

```
:set list
# Tabs appear as ^I

# Stop showing them
:set nolist
```

http://www.unix.com/unix-for-dummies-questions-and-answers/22389-how-see-special-characters-file-using-vi.html


### NERDTree

http://www.vim.org/scripts/script.php?script_id=1658

Download and unzip into `~/.vim`

```
:NERDTree
```


### Show whitespace characters

```
:set list

# may also be helpful
:syntax on
# use syntax for Whitespace programming language
:set syntax=whitespace
```
http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character


### Delete trailing whitespace

```
:%s/\s\+$//
```

http://vim.wikia.com/wiki/Remove_unwanted_spaces


### Tab Pages

```
gt # next tab
gT # previous tab
{i}gt  # go to tab i (1-indexed)

:tabnew  # open new tab
:tabnew FILE  # open FILE in new tab
:tabe FILE  # open FILE in new tab
:tabc  # close current tab
:tabc i  # close tab i (1-indexed)
:tabm i  # move tab to position i (0-indexed)
:tabm +i  # move tab forward i positions
:tabm -i  # move tab backward i positions
```

https://stackoverflow.com/questions/7961581/is-there-a-vim-command-to-relocate-a-tab
https://www.techrepublic.com/blog/linux-and-open-source/use-tabs-to-open-multiple-files-in-vim/
https://vim.fandom.com/wiki/Using_tab_pages


### Find file within vim

```
:set path=/path/to/project/**

:find file.ext

# open in new tab/split-screen
:tabfind
:sfind
```

http://stackoverflow.com/questions/3241566/is-there-a-quick-way-with-macvim-nerdtree-plugin-to-find-a-file
