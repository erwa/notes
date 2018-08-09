### Show document outline / table of contents on sidebar

View -> Show outline

https://support.google.com/docs/answer/6367684?hl=zh-Hant&co=GENIE.Platform%3DDesktop


### Exchange rate

```
# Convert from X to USD
=GOOGLEFINANCE("CURRENCY:"&E2&"USD")
```

https://www.ablebits.com/office-addins-blog/2017/11/30/currency-conversion-google-sheets/


### Subscript / Superscript

```
Cmd + ,  # Subscript
Cmd + .  # Superscript
```

https://productforums.google.com/forum/#!topic/docs/H90aHHv2bIU


### Disable smart quotes

Tools --> Preferences --> Uncheck "use smart quotes"

http://www.solveyourtech.com/turn-off-smart-quotes-google-docs/


### Chat / Anonymity

May need to explicitly be added as a person the doc is shared with for you to see the chat and not show up as an anonymous animal.


### Rename folder or file in Google Drive

```
n
```

https://support.google.com/drive/answer/2563044?hl=en


### Count if not empty

```
=COUNTIF(A6:A, "<>")
```

https://stackoverflow.com/questions/12519073/google-docs-count-cells-that-contain-any-text


### LaTex in Google Docs

Auto-LaTeX Equations plugin
https://chrome.google.com/webstore/detail/auto-latex-equations/iaainhiejkciadlhlodaajgbffkebdog

To enable: Add-ons -> Auto-Latex Equations -> Start

https://sites.google.com/site/autolatexequations/tutorial


### Download image from Google Slides

Go to presentation mode -> Inspect Element -> get image URL -> go there and save


### Convert number to letter

```
=CHAR(1 + 64)
```


### Convert letter to number

```
=CODE('A')-64
```


### Change sheets

Cmd + Shift + Fn + Up/Down

https://support.google.com/docs/answer/181110?co=GENIE.Platform%3DDesktop&hl=en


### Document Owner and Creation Date

File -> Document Details


### Force row height

If you want row height to be less than text height (with newlines), that's not possible currently.

https://webapps.stackexchange.com/questions/6953/in-a-google-spreadsheet-how-can-i-force-a-row-to-be-a-certain-height


### Change font to monospace

Option + /, search "Courier" (typing "cou" is sufficient), press Enter

https://webapps.stackexchange.com/questions/53643/how-can-i-change-the-font-in-google-docs-just-with-keyboards-shortcuts


### Insert CSV into Google Spreadsheet

File -> Import -> select CSV -> from current cell


### Color Code Based on Value

Format -> Conditional Formatting

https://support.google.com/docs/answer/78413?co=GENIE.Platform%3DDesktop&hl=en


### Google Drive Keyboard Shortcuts

```
// share
. (dot)
```
https://support.google.com/drive/answer/2563044?hl=en


### Google Drive Permissions

Inherited, unless the permissions of a folder/document were changed from the default setting.

https://gsuitetips.com/tips/drive/protect-your-google-drive-folders-by-setting-permissions/


### Add row below in table

```
Cmd + Option + B, B
```

https://support.google.com/docs/answer/179738?co=GENIE.Platform%3DDesktop&hl=en


### Side-by-side tables/text

Create 1x2 table. Insert table in first cell. Insert another table/text in second cell.

Hide 1x2 table by setting border to 0 px or changing border color to background color.

http://www.mousewhisperer.co.uk/drivebunny/aligning-tables-side-by-side-in-google-docs/


### Export spreadsheet without gridlines

File -> Export as -> PDF -> check "No Gridlines"

https://productforums.google.com/forum/?hl=en#!category-topic/docs/formatting/oxFWS7Gl8tk


### Notes

You can Insert -> Note in a spreadsheet which will yield a pop-up when you click on a cell.


### Insert Anchor

Insert -> Bookmark

http://smallbusiness.chron.com/insert-anchor-google-docs-48623.html


### Decrease Font Size / Increase Font Size

Cmd + Shift + . / ,

Cmd + Shift + < / >

https://blog.tryadhawk.com/marketing-tips/google-docs-shortcuts/


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