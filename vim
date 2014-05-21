# open most recent file in a directory
vim `ls -t | head -1`

# yank entire file
:%y

# vim count number of occurrences of pattern
:%s/pattern//gn

# vim show special characters
:set list

# vim turn off search highlighting
:set nohlsearch