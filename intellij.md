### Zoom

Use reverse pinch on trackpad. Or in Preferences -> Editor -> General -> enabled "Change font size (Zoom) with Ctrl/Cmd + MouseWheel"

https://www.jetbrains.com/help/rider/Zooming_in_the_Editor.html


### Issue: `Error:java: javacTask: source release 8 requires target release 1.8`

Preferences -> Build, Execution, Deployment -> Compiler -> Java Compiler -> change Target bytecode version to 8

https://stackoverflow.com/questions/29888592/errorjava-javactask-source-release-8-requires-target-release-1-8


### Settings window won't open

Probably plugin is causing problem. Check blinking red circle with exclamation point in bottom-right.

https://intellij-support.jetbrains.com/hc/en-us/community/posts/206254389-can-not-open-Settings


### Community vs. Ultimate Edition differences

Ultimate supports JavaScript.


### Set default JDK

File -> Other Settings -> Default Project Structure -> Project Settings -> Project -> Project SDK.

To control the default 1.8 JDK, name the specific 1.8 JDK you want to be the default "1.8".


### Run Scala Test

Right click -> Run

Make sure your project's SDK is a new version of Java 8+ (e.g. 1.8u121) or you might get weird VerifyErrors.


### Copy multi-line string

Place cursor on value of string -> Alt + Enter -> Copy String Concatenation Text to the Clipboard

https://stackoverflow.com/questions/31699115/intellij-idea-reverse-paste-into-string-aka-copy-from-string


### Enable warning

Cmd + , -> Editor -> Inspections -> ensure check mark next to warning


### Disable warning for one line

Alt Enter -> right arrow to expand to submenu -> should be an option

```
//noinspection JavaReflectionMemberAccess
```

https://stackoverflow.com/questions/7798908/disable-warning-in-intellij-for-one-line


### Enable / Disable parameter hints

To disable, right click on the hint -> Disable.

https://stackoverflow.com/questions/40866202/intellij-shows-method-parameter-hints-on-usage-how-to-disable-it


### Profiler

Install VisualVM plugin. Give path to `$JAVA_HOME/bin/jvisualvm`. Right click green triangle next to main() method -> Run with VisualVM.


### Show valid parameters

Cmd + P within parentheses


### Surround with

Option + Cmd + T

Can surround with if / while / try blocks.


### Set Project SDK

Cmd + ; (File -> Project Structure) -> Project -> choose Project SDK.


### Lombok Plugin

Preferences -> Settings -> Plugins -> Browse repositories -> Search for "lombok" -> Install Lombok Plugin

Preferences -> Build, Execution, Deployment -> Compiler -> Annotation Processors -> Enable Annotation Processing

https://github.com/mplushnikov/lombok-intellij-plugin


### See memory usage of process

Use JVM Debugger Memory View plugin: https://blog.jetbrains.com/idea/2016/08/jvm-debugger-memory-view-for-intellij-idea/


### UML (Unified Modeling Language) Diagrams

Right click class -> Diagram -> Show Diagram.

To show descendants, select element, Option + Command + B.

https://www.jetbrains.com/help/idea/2017.1/viewing-ancestors-descendants-and-usages.html


### Line Width

Preferences -> Editor -> Code Style -> Right margin (columns)


### See how data flows to method

Right click -> Analyze -> Analyze Data Flow to Here


### Iterate over array

Type `itar, Tab`.

```
String[] array1, array2;
itar
```

changes to

```
String[] array1, array2;
for (int i = 0; i < array1.length; i++) {
```



### Extract variable

```
Option + Cmd + V
```

Move complicated expression into a separate variable.


### Don't use wildcard imports

```
Cmd + , -> Editor -> Code Style -> Java -> Imports -> select "Use single class import" -> set "Class count to use import with '*'" to 999 -> set "Names count to use static import with '*'" to 999
```

http://stackoverflow.com/questions/3348816/intellij-never-use-wildcard-imports


### Jump to matching brace

```
Shift + Cmd + M
```

https://www.jetbrains.com/help/idea/2016.3/navigating-to-braces.html


### Very slow indexing

Indexing uses a lot of CPU but should not cause the UI to lag/hang. If it is, one thing to try is File -> Invalidate Caches / Restart -> Invalidate and Restart. Note that subsequently IntelliJ will have to re-index all your projects and this can take a while.

http://stackoverflow.com/questions/32550292/why-is-intellij-idea-hanging-on-indexing


### `System.out.println`

```
sout, Tab
```
http://stackoverflow.com/questions/3320764/how-to-make-system-out-println-shorter


### Show Javadoc / documentation

```
# Windows
Ctrl + Q

# Mac
Ctrl + J
```


### Open Recent

```
Shift + Cmd + A, "Open Recent"
```


### Conditional Breakpoint

Right click on breakpoint -> Condition. Examples:

```
var.varname.equals("bar")

typeDescr == null
```

https://www.jetbrains.com/help/idea/configuring-breakpoints.html


### New View into File

Right click file tab -> Split Vertically.


### Dark Theme

Intellij IDEA -> Preferences -> Appearance & Behavior -> Appearance -> Theme: Darcula


### See recent changes

Option + Shift + C


### Find symbol (method, field)

Option + Shift + Cmd + N


### Increase build process heap size

Preferences -> Build, Execution, Deployment -> Compiler -> Build process heap size

https://stackoverflow.com/questions/8581501/how-can-i-give-the-intellij-compiler-more-heap-space


### Increase IntelliJ memory limit

Help -> Edit Custom VM Options

http://stackoverflow.com/questions/13578062/how-to-increase-ide-memory-limit-in-intellij-idea-on-mac


### Add directory to classpath

Project -> Dependencies -> Add Jar or Directories -> select -> choose Classes.

https://stackoverflow.com/questions/854264/how-to-add-directory-to-classpath-in-an-application-run-profile-in-intellij-idea


### Add source directory

Project View -> Right click -> Mark Directory As -> Sources Root


### Python virtualenv

* Add SDK -> Python virtualenv
* SDK home path should be to bin/python2.7 in venv
* Classpath should include:

```
venv/lib/python2.7/site-packages
venv/lib/python2.7/lib-dynload
/usr/lib/python2.7
/usr/lib/python2.7/plat-darwin
/usr/lib/python2.7/lib-tk
```

http://stackoverflow.com/questions/20877106/using-intellijidea-within-an-existing-virtualenv


### Resolving git merge conflicts

Use IntelliJ UI.


### Git Commit

Right click on project in Project Explorer -> Git -> Commit Directory


### Git Annotate

Right click next to line -> Annotate. Search (Cmd + Shift + A) "Show History" command to see file history.


### Compare files between branches

Compare with Branch (Cmd + Shift + A)


### Disable auto-deletion of trailing whitespace

Preferences (Cmd + ,) -> Editor -> General -> Other
(can also search for "trailing" in Preferences)

http://stackoverflow.com/questions/26354301/how-do-i-auto-remove-trailing-whitespace-in-android-studio


### Disable auto-formatting for project

Preferences (Cmd + ,) -> Editor -> Code Style -> Scheme: Project -> <Language> (e.g.: Java) -> Uncheck/check formatting rules


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


### Red J

IntelliJ recognizes Java file but it's not part of project sources. Right click directory in Project Window -> Mark Directory As -> Source Root.

http://stackoverflow.com/questions/30131939/intellij-idea-files-with-a-red-circle


### Jump between syntax errors / suggestions

```
# Navigate -> Next/Previous Highlighted Error
F2 / Shift + F2
```
http://stackoverflow.com/questions/11775315/intellij-show-where-errors-are

If errors, red exclamation point bubble will appear at the top of the scroll bar.

https://www.jetbrains.com/help/idea/2016.2/code-analysis.html


### Highlight all occurrences of variable / highlight method invocations that throw exceptions

```
Shift + Cmd + F7

# Use F3 / Shift + F3 to navigate through occurrences

# Use Esc to unhighlight
```
http://stackoverflow.com/questions/7773670/highlight-exception-throwers-in-intellij-idea


### Word Wrap

View -> Active Editor -> Use Soft Wraps


### Organize Imports / Sort Imports

```
Cmd + Option + O
```

https://stackoverflow.com/questions/8608710/intellij-organize-imports


### Move line up/down

```
Option + Shift + arrow (up/down)
```


### Move method up/down

```
Cmd + Shift + arrow (up/down)
```


### Change casing / uppercase

```
Shift + Cmd + U
```


### Pop-up method implementation / show method definition

Cmd + Shift + I


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


### Evaluate expression during debugging

Alt + click expression


### See more entries for variable in debugger

Expand variable, then right click variable -> Adjust Range


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


### Go to interface declaration

Go to super method: `Cmd + U`


### Go to implementations of interface method

```
Option + Cmd + B
```


### Multiline edit

```
Alt + Shift + Click
```

http://blog.jetbrains.com/idea/2014/03/intellij-idea-13-1-rc-introduces-sublime-text-style-multiple-selections/


### Find and Replace in entire project

Edit -> Find -> Replace in Path


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

### Gradle integration

Import Project -> select the root build.gradle file

View -> Tool Windows -> Gradle (only appears for Gradle projects)


### Gradle IDEA IntelliJ project file generation

```
# if it doesn't seem to be refreshing the project in IntelliJ,
# try running `cleanIdea` and deleting `out` and `build` directories
gradle idea
```

File -> Open -> select .ipr file
https://docs.gradle.org/current/userguide/idea_plugin.html

# Show type hierarchy
Control + H
# http://stackoverflow.com/questions/3990781/how-to-show-all-parents-and-subclasses-of-a-class-in-intellij-idea

# Search across all files
Control + Shift + F

# Find usages
Cmd + B, Option + F7

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
Cmd + Backspace
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