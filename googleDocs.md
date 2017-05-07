### Insert Anchor

Insert -> Bookmark

http://smallbusiness.chron.com/insert-anchor-google-docs-48623.html


### Decrease Font Size / Increase Font Size
Cmd + Shift + < / >


### Hide page breaks
View -> disable Print View

http://stackoverflow.com/questions/33195011/how-to-turn-off-page-breaks-in-google-docs


### COUNTIF not blank
```
=COUNTIF(F90:F158,"<>")
```
http://stackoverflow.com/questions/12519073/google-docs-count-cells-that-contain-any-text


### SUMIF

Range to be tested against criteria comes FIRST.
```
=SUMIF(range_to_be_tested_against_criteria, criteria, range_to_be_summed)
```

https://support.google.com/docs/answer/3093583?hl=en

### SUMIFS

```
=SUMIFS(sum_range, criteria_range_1, criteria1, criteria_range_2, criteria2, ...)
```
https://support.google.com/docs/answer/3238496?hl=en


### Keyboard Shortcuts
* https://support.google.com/docs/answer/179738?hl=en
* `Ctrl/Command + /` for help.

```
# Align Right
Cmd + Shift + R

# Align Center
Cmd + Shift + E
```


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
Alt + I, B

# Mac
Ctrl + option + I, B
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