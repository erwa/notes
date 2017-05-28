### Add specific songs to iPhone

Drag and drop songs from your iTune Library to your phone icon on left.

https://support.apple.com/en-us/HT201593

If having issues, delete all songs (can do so from iTunes on Mac) and then recopy.


### Rip / burn CDs

Use iTunes, select CD icon in top-left, then click Import in top-right.

http://www.macworld.com/article/1156861/software-graphics/howto-rip-cds.html


### Find frame rate of video
Open in QuickTime -> Cmd + I

https://forums.macrumors.com/threads/how-to-find-out-the-frame-rate-of-a-video.1109804/


### Lock screen / sleep
Ctrl + Shift + Power


### Task monitor
Spotlight -> Activity Monitor

http://apple.stackexchange.com/questions/41125/where-can-i-find-the-task-manager-in-mac-os-x-lion


### Microphone not working Google Hangouts
```
sudo killall coreaudiod
```
http://superuser.com/questions/566102/microphone-not-working-with-google-hangout


### Esc key icon
⎋ means Esc.
http://superuser.com/questions/421890/what-is-the-key


### Zoom
Pinch or spread with 2 fingers on trackpad. Some programs support it, some don't.


### Taking a picture with built-in webcam
Use Photo Booth.
* http://apple.stackexchange.com/questions/11497/can-i-take-a-still-photo-with-my-built-in-webcam

### Taking screenshots
```
Shift+Cmd+3
```
Picture gets saved on Desktop

Select area to screenshot, picture gets saved on Desktop
```
Shift+Cmd+4
```

Take a screenshot of a window
```
Shift + Cmd + 4, Space
```
https://support.apple.com/en-us/HT201361


Print screen to clipboard
```
Cmd + Control + Shift + 3
```

More screenshot variations:
* http://guides.macrumors.com/Taking_Screenshots_in_Mac_OS_X

### open file from Terminal using default app
```
open <file>
```

### Open Finder location in Terminal
Drag the Finder file or folder to the Terminal.
* http://apple.stackexchange.com/questions/11323/how-can-i-open-a-terminal-window-directly-from-my-current-finder-location

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


### Homebrew
```
# check if package installed
brew list <package_name>
brew list  # see all installed packages
# http://apple.stackexchange.com/questions/101090/list-of-all-packages-installed-using-homebrew

brew search <keyword>
brew install <package_name>
```


### Crop a picture
Open picture in Preview, Save a Copy first! (if you modify the original, once Preview is closed after cropping, you cannot recover original)
# Drag a rectangle
Cmd + K (Tools --> Crop)
(Cmd + Z to undo crop)

### Edit/annotate picture
Open in Preview, click "toolbox" icon on icon bar.

### Use arrow keys to move through image previews
Press "Space" in Finder, use Up and Down arrow keys to change picture.

http://apple.stackexchange.com/questions/37914/move-through-images-in-a-folder-with-preview-app

### Force quit application
Cmd + Option + Esc -> Choose app

### Show all root folder contents in Finder
http://apple.stackexchange.com/questions/34871/how-to-view-root-directory-and-subdirectories-in-finder
```
defaults write com.apple.finder AppleShowAllFiles TRUE
```

### Open app as root
```
sudo /Applications/Audacity/Audacity.app/Contents/MacOS/Audacity
```
http://osxdaily.com/2013/02/06/how-to-run-gui-apps-as-root-in-mac-os-x/

### Show hidden files in Open dialog
http://apple.stackexchange.com/questions/114628/display-hidden-files-hot-key-on-mavericks-gone
```
# Must be done in List view, not Column view!
Cmd + Shift + .
```

### Go to Folder in Finder / Open Folder in Finder
```
Shift + Cmd + G
```
http://superuser.com/questions/44086/open-folder-for-a-given-path-in-mac-os-x
http://www.alexandre-gomes.com/?p=376

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

### Bulk Rotate Pictures
* Select all pictures, Cmd + O to open in Preview
* Cmd + R/L to rotate
* Cmd + S to save all changes.

http://osxdaily.com/2012/05/11/batch-rotate-a-group-of-images-with-preview-for-mac-os-x/


### Open iPhone photos in Finder
Use Image Capture to export to a folder, which you can then open in Finder.


### Delete iPhone photos from Mac
https://discussions.apple.com/thread/3075727?start=0&tstart=0
1. Connect phone.
2. Open "Image Capture".
3. Click iPhone icon on left.
4. Select pictures to delete.
5. Press "Delete" icon.

### Shrink PDF size
Open PDF in Preview. File -> Export -> change Quartz Filter to "Reduce File Size".
* http://www.cultofmac.com/260256/use-preview-make-pdf-documents-smaller-os-x/


### Adjust Picture Size
Preview -> Tools -> Adjust Size
http://www.wikihow.com/Resize-Pictures-(for-Macs)

Batch resize with Preview: http://osxdaily.com/2009/12/16/batch-resize-images-on-mac-with-preview/


### Text forwarding
* Make sure phone and Mac are on same wifi network.
* Open Messages on your Mac, sign in to iCloud
* Make sure you're signed in to iCloud on your phone.
* Settings -> Messages -> Send & Receive -> send as iCloud, add email
* Text Forwarding should appear in iMessage menu, verification code should pop up on Mac, enter on phone.


http://recomhub.com/blog/apple-ios-9-2-how-to-activate-text-message-forwarding/


### Chinese input
```
# punctuation and emojis
Shift + 6
```