# Take screenshot, picture gets saved on Desktop
Shift+Cmd+3

# Select area to screenshot, picture gets saved on Desktop
Shift+Cmd+4

# More screenshot variations
http://guides.macrumors.com/Taking_Screenshots_in_Mac_OS_X

# open file from Terminal using default app
open <file>

# When ssh'ing from a Mac, you may need to add -A in order for git SSH connections to work. E.g.:
ssh -A host
# Without -A, git push/pull will prompt for a password (and no password seems to work)

# Page Down and Up
fn + <up/down>
fn + [Shift +] <space>

# Minimize all windows
cmd + alt + m

# Hide all windows except current
cmd + alt + h

# Show desktop
# https://superuser.com/questions/139922/show-desktop-keyboard-shortcut-in-mac-os-x/
Cmd + F3 (no need to press Fn key)
Fn + F11

### Diagonal arrow
```
Function + left/right
```
http://apple.stackexchange.com/questions/122514/how-do-i-do-a-diagonal-arrow-keyboard-shortcut


### Arrow with two bars through it
```
Function + up/down
```
http://apple.stackexchange.com/questions/122514/how-do-i-do-a-diagonal-arrow-keyboard-shortcut


# Install package using Homebrew
brew search <keyword>
brew install <package_name>

# Crop a picture
# Open picture in Preview, Save a Copy first! (if you modify the original, once Preview is closed after cropping, you cannot recover original)
# Drag a rectangle
Cmd + K (Tools --> Crop)
(Cmd + Z to undo crop)

### Edit/annotate picture
Open in Preview, click "toolbox" icon on icon bar.

### Use arrow keys to move through image previews
Press "Space" in Finder, use Up and Down arrow keys to change picture.

http://apple.stackexchange.com/questions/37914/move-through-images-in-a-folder-with-preview-app

# Force quit application
Cmd + Option + Esc -> Choose app

Show all root folder contents in Finder: http://apple.stackexchange.com/questions/34871/how-to-view-root-directory-and-subdirectories-in-finder
```
defaults write com.apple.finder AppleShowAllFiles TRUE
```

Show hidden files in Open dialog: http://apple.stackexchange.com/questions/114628/display-hidden-files-hot-key-on-mavericks-gone
```
# Must be done in List view, not Column view!
Cmd + Shift + .
```

# iOS development

### Launch app on device
https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/LaunchingYourApponDevices/LaunchingYourApponDevices.html#//apple_ref/doc/uid/TP40013839-CH34-SW1

### Yosemite: Maximize but don't full screen
```
Option + Click green button
Option + Shift + Click green button
```
http://apple.stackexchange.com/questions/139884/make-the-green-full-screen-window-icon-on-yosemite-maximize-windows

### Move window to another desktop
Open Mission Control (three finger swipe up), drag window to other desktop.

http://superuser.com/questions/184763/is-there-a-way-to-move-the-current-window-to-another-desktop-without-using-a-mou

### Terminal prompts for "login"
Try deleting the entry containing "localhost" from ~/.ssh/known_hosts.

### Rotate screen
System Preferences -> Cmd + Option + click Display --> Rotation option should appear