# 10 Eclipse Shortcuts
# http://rayfd.me/2007/05/20/10-eclipse-navigation-shortcuts-every-java-programmer-should-know/

# Move current line up/down
Alt + Up/Down

# Uppercase text
Ctrl+Shift+X

# Lowercase text
Ctrl+Shift+Y

# OS X - switch tabs
Fn + Ctrl + Up/Down

# Auto-complete on Linux
Ctrl+Space

# Output to file
# http://stackoverflow.com/questions/5714053/how-can-we-redirect-eclipse-console-output-to-a-file
Run --> Run Configurations --> Common

# Generate Javadoc
Project -> Generate Javadoc...
# To ensure links work, make sure to select the reference archives/projects on the second page of the wizard

# In order for Java Save Actions (like auto-formatting) to apply to a Java file,
# you must ensure the Java file is on a project's build path

# To figure out what jar a class is in
Ctrl + Shift + T --> search for the class

# Renaming projects (changing the default name) may cause issues if you use `gradle eclipse` and your project depends on other projects.

# See all Eclipse warnings
# http://stackoverflow.com/questions/6786660/how-to-find-complete-list-of-warnings-in-eclipse-ide
# Small triangle in upper right corner --> Configure Contents --> Show all itmes --> Uncheck "Use item limits"

# Jump to method/field
Ctrl + O # Press again to show inherited members, too
Ctrl + Shift + Up/Down # jump to next/previous method/field

# Switch to a different open file
Ctrl + E, Up/Down

Run test:
```
Shift + Alt + X, T
```

### Jump to matching brace/bracket/parenthesis
Ctrl + Shift + P. See http://stackoverflow.com/questions/289342/eclipse-jump-to-closing-brace.

### Change build output dir
```
Project Properties --> Java Build Path --> Source --> Check "Default output folder:"
```
http://stackoverflow.com/questions/3191693/how-do-i-change-a-java-projects-bin-folder-in-eclipse