### Find symbol (method, field)
Option + Shift + Cmd + N


### Increase memory limit
Help -> Edit Custom VM Options

http://stackoverflow.com/questions/13578062/how-to-increase-ide-memory-limit-in-intellij-idea-on-mac


### Add source directory
Project View -> Right click -> Mark Directory As -> Sources Root


### Python virtualenv
http://stackoverflow.com/questions/20877106/using-intellijidea-within-an-existing-virtualenv


### Git
Right click next to line -> Annotate. Search (Cmd + Shift + A) "Show History" command to see file history.

#### Compare files between branches
Compare with Branch (Cmd + Shift + A)


### Reformat file
```
Option + Cmd + L
```


### Show whitespace characters
View -> Active Editor -> Show Whitespaces

http://stackoverflow.com/questions/9868796/how-to-display-hidden-characters-by-default-zero-width-space-ie-8203


### Generate main method
Type `psvm`, then press Enter.

https://www.jetbrains.com/help/idea/2016.1/generating-main-method-example-of-applying-a-simple-live-template.html


### Jump between syntax errors / suggestions
```
F2 / Shift + F2
```


### Highlight all occurrences of variable
```
Shift + Cmd + F7

# Use F3 / Shift + F3 to navigate through occurrences

# Use Esc to unhighlight
```


### Word Wrap
View -> Active Editor -> Use Soft Wraps


### Organize Imports
```
Cmd + Option + O
```


### Move line up/down
```
Option + Shift + arrow (up/down)
```


### Move method up/down
```
Cmd + Shift + arrow (up/down)
```


### Change casing
```
Shift + Cmd + U
```


### Peek at Code
If you hover your mouse cursor over the scroll bar, a pop-up will show you the code at that location.


### Add folder to classpath
```
Project Structure (select project in navigation window, F4) --> Dependencies --> + --> JARS or directories --> select directory --> OK --> use "Classes" as category of selected file
```
http://stackoverflow.com/questions/854264/how-to-add-directory-to-classpath-in-an-application-run-profile-in-intellij-idea


### Expand code block
```
Cmd + .
```


### Collapse code block
```
Cmd + Shift + .
```


### Expand selection
```
Cmd + W
```
Example: Put cursor in word, Cmd + W will expand to word, then another word or method, then whole line, then block, then method, etc.


### Debug Window
```
Cmd + 5
```


### Search for Action or Option
```
Shift + Cmd + A
```


### Maven support
You can open pom.xml files from IntelliJ and it will automatically resolve dependencies. You can specify the profiles to import by navigating to View -> Tool Windows -> Maven Projects -> Profiles


### Go to implementations of interface method
```
Option + Cmd + B
```


### Multiline edit
```
Alt + Shift + Click
```
http://blog.jetbrains.com/idea/2014/03/intellij-idea-13-1-rc-introduces-sublime-text-style-multiple-selections/


### Keyboard shortcuts

```
# Duplicate line
Cmd + D

# Rename method or variable
Shift + F6

# Find and replace
Cmd + R

# Close tab
Cmd + F4
Shift + click tab

# Change files
Cmd + E

# Find jar a class came from
Hold Cmd, hover mouse over class
# http://stackoverflow.com/questions/275120/java-how-do-i-know-which-jar-file-to-use-given-a-class-name

# Open Project Settings (Module Settings)
Select project in Project Navigation (Cmd + 1), then press F4

# Run
Shift + F10

# Run for the first time
Option + Shift + F10

# Build (Make Project)
Cmd + F9

# Gradle integration
gradle idea
# File -> Open -> select .ipr file
# https://docs.gradle.org/current/userguide/idea_plugin.html

# Show type hierarchy
Control + H
# http://stackoverflow.com/questions/3990781/how-to-show-all-parents-and-subclasses-of-a-class-in-intellij-idea

# Search across all files
Control + Shift + F

# Find usages
Option + F7

# Go back, go to previous location
Option + Cmd + Left

# Jump to method
Cmd + B

# Search for command
Cmd + Shift + A

# Navigate to a file
Cmd + Shift + N

# Navigate to a class
Cmd + N

# Show methods (show class structure, overview of class)
Cmd + F12
# http://stackoverflow.com/questions/3990289/intellij-shortcut-to-show-a-popup-of-methods-in-a-class-that-can-be-searched

# Auto-complete
Control + Space

# Jump to beginning of file
Fn + Cmd + Left Arrow
# http://stackoverflow.com/questions/7110573/intellij-beginning-of-file-keyboard-shortcut

# Open embedded terminal
Option + F12
# https://www.jetbrains.com/idea/help/working-with-embedded-local-terminal.html

# Delete line
Cmd + Y

# Turn Project navigation window on/off
Cmd + 1
```

### Other Tricks
```
# Show file in project browser
Press the cross-hairs button
# http://stackoverflow.com/a/25114695/1128392
```