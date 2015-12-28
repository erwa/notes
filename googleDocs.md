### Keyboard Shortcuts
* https://support.google.com/docs/answer/179738?hl=en
* `Ctrl/Command + /` for help.

### Choose heading format
`Cmd + Option + <heading_size>`

# Inserting and Deleting Rows

### Insert a row above
```
Alt + I, R

# Mac
Ctrl + option + I, R
```

### Insert a row below
```
Alt + I, W

# Mac
Ctrl + option + I, W
```

### Delete a row
```
Alt + E, D

# Mac
Ctrl + option + E, D
```

# Inserting and Deleting Columns

### Insert column
```
# Mac
# Insert column left
Ctrl + option + I, C

# Insert column right
Ctrl + option + I, G
```

### Delete column
```
# Mac
Ctrl + option + E, E
```

### Not possible to format (e.g.: bold) part of a cell
It's all or nothing. See https://productforums.google.com/forum/#!topic/docs/PELcAqnlSoE%5B1-25-false%5D.

### Get current row
```
=ROW()
```

### SUM after applying transformation to range of cells
```
=SUM(ARRAYFORMULA(VALUE(SUBSTITUTE(A1:A5," ft",""))))
```