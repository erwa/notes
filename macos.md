### Split windows left and right / side-by-side windows / split view

Hold down green full screen button and select Tile Left/Right.

https://support.apple.com/en-us/HT204948


### Print source code

Use TextWrangler.

https://apple.stackexchange.com/questions/56629/printing-source-code-with-os-x


### Create custom keyboard shortcut

System Preferences -> Keyboard -> Shortcuts -> App shorcuts

Name of command must *exactly match* name of command. If you're using Chinese, you must enter the command in Chinese.

http://osxdaily.com/2017/08/08/create-custom-keyboard-shortcut-mac/


### Edit iPhone contact on Mac

Use Contacts app.

https://support.apple.com/zh-tw/guide/contacts/make-changes-to-your-contacts-adrbk1515/mac


### kernel_task

When processes are using a lot of CPU and the computer is getting too hot, kernel_task will automatically run and hog CPU to reduce the amount of CPU available to the intense processes.

https://support.apple.com/en-is/HT207359


### Brighten photo

Photos app --> open photo --> Edit --> dial button for adjusting brightness

https://www.tomsguide.com/us/edit-photos-os-x-tips,news-20828.html


### Hide dock / show dock

```
Cmd + Option + D
```

https://lifehacker.com/5814382/hide-and-show-the-os-x-dock-with-a-keyboard-shortcut


### Location of Trash directory

```
~/.Trash
```

http://kb.mit.edu/confluence/display/istcontrib/View+Trash+directory+in+Mac+OS+X+via+Terminal


### OS X version

```
/usr/bin/sw_vers
```


### Record video using webcam

QuickTime -> File -> New Video


### Record audio

QuickTime -> File -> New Audio

https://www.mactip.net/how-to-record-sound-on-a-mac/


### Trim audio

Open in QuickTime -> Cmd + T to open Trim Mode.

http://osxdaily.com/2010/09/16/trim-mp3-on-your-mac/


### Disable updates

Preferences --> App Store --> Uncheck "Automatically check for updates"

https://mac-how-to.gadgethacks.com/how-to/disable-annoying-software-update-notifications-your-mac-0164224/


### Always show scroll bars

Settings -> General -> Show scroll bars -> Always

http://osxdaily.com/2011/08/03/show-scroll-bars-mac-os-x-lion/


### Timer for Mac

https://www.apimac.com/mac/timer/


### Permanently remove default apps from dock

Disable System Integrity Protection: Restart, when you hear chime, press Cmd + R. Utilities -> Terminal -> csrutil disable -> reboot.

```
sudo /usr/libexec/PlistBuddy -c "delete:add-app" /System/Library/CoreServices/Dock.app/Contents/Resources/com.apple.dockfixup.plist

sudo /usr/libexec/PlistBuddy -c "delete:add-doc" /System/Library/CoreServices/Dock.app/Contents/Resources/com.apple.dockfixup.plist
```

Re-enable System Integrity Protection: Restart, when you hear chime, press Cmd + R. Utilities -> Terminal -> csrutil enable -> reboot.

Now when you remove icons from dock, they will not come back upon relogin or reboot.

https://apple.stackexchange.com/questions/227272/permanently-remove-icons-from-dock


### Add specific songs to iPhone

Drag and drop songs from your iTune Library to your phone icon on left.

https://support.apple.com/en-us/HT201593

If having issues, delete all songs (can do so from iTunes on Mac) and then recopy.


### Burn music CDs

iTunes -> create playlist -> add songs -> File -> Burn -> Music CD


### Rip music CD

Use iTunes, select CD icon in top-left, then click Import in top-right.

http://www.macworld.com/article/1156861/software-graphics/howto-rip-cds.html


### Copy video from phone to Mac

Use Photos app. Once imported, select pictures -> File -> Export.


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

`⎋` means Esc.

http://superuser.com/questions/421890/what-is-the-key


### Zoom

Pinch or spread with 2 fingers on trackpad. Some programs support it, some don't.


### Taking a picture with built-in webcam / take a selfie

Use Photo Booth.

* http://apple.stackexchange.com/questions/11497/can-i-take-a-still-photo-with-my-built-in-webcam


### Clipboard Manager

Clip: Cmd + Shift + V to select what to paste

https://clipy-app.com/


### Taking screenshots / copy screenshot to clipboard

```
# Copy screenshot to clipboard
Ctrl + Shift + Cmd + 4

# Picture gets saved on Desktop
Shift+Cmd+3

# Select area to screenshot, picture gets saved on Desktop
Shift+Cmd+4

# Take a screenshot of a window
Shift + Cmd + 4, Space
```

https://support.apple.com/en-us/HT201361

```
# Print screen to clipboard
Cmd + Control + Shift + 3
```

More screenshot variations:
* http://guides.macrumors.com/Taking_Screenshots_in_Mac_OS_X


### Open file from Terminal using default app

```
open <file>
```


### Open Terminal location in Finder

```
open .
```

http://osxdaily.com/2009/11/30/open-current-folder-in-finder-from-the-terminal/


### Open Finder location in Terminal

Drag the Finder file or folder to the Terminal.

* http://apple.stackexchange.com/questions/11323/how-can-i-open-a-terminal-window-directly-from-my-current-finder-location


### SSHFS / mount remote filesystem over SSH

First install FUSE and SSHFS. Then use

```
sshfs username@server:/path-on-server/ ~/path-to-mount-point
```

https://github.com/osxfuse/osxfuse/wiki/SSHFS


### SSH

When ssh'ing from a Mac, you may need to add -A in order for git SSH connections to work. E.g.:

```
ssh -A host
# Without -A, git push/pull will prompt for a password (and no password seems to work)
```


### Page Down and Up

fn + <up/down>
fn + [Shift +] <space>


### Minimize all windows

cmd + alt + m


### Hide all windows except current

cmd + alt + h


### Show desktop

```
Cmd + F3 (no need to press Fn key, unless function lock enabled)

# use menu key (next to right Ctrl) on Windows keyboard for Fn
Fn + F11
```

https://superuser.com/questions/139922/show-desktop-keyboard-shortcut-in-mac-os-x/


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
# check installation location
brew info <package>
# https://apple.stackexchange.com/questions/145437/where-can-i-find-the-installed-package-path-via-brew

# check if package installed
brew list <package_name>
brew list  # see all installed packages
# http://apple.stackexchange.com/questions/101090/list-of-all-packages-installed-using-homebrew

brew search <keyword>
brew install <package_name>
```


### Crop a picture

Open picture in Preview, Save a Copy first! (if you modify the original, once Preview is closed after cropping, you cannot recover original)

To drag a rectangle:

```
Cmd + K (Tools --> Crop)
(Cmd + Z to undo crop)
```


### Edit/annotate picture

Open in Preview, click "toolbox" icon on icon bar.


### Use arrow keys to move through image previews

Press "Space" in Finder, use Up and Down arrow keys to change picture.

http://apple.stackexchange.com/questions/37914/move-through-images-in-a-folder-with-preview-app


### Force quit application

Cmd + Option + Esc -> Choose app


### Show all root folder contents in Finder / show hidden files

```
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
```

https://appleinsider.com/articles/18/07/27/how-to-see-hidden-files-and-folders-in-macos
http://apple.stackexchange.com/questions/34871/how-to-view-root-directory-and-subdirectories-in-finder


### Open app as root / run application as admin

```
sudo /Applications/Audacity/Audacity.app/Contents/MacOS/Audacity
sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark
```

http://osxdaily.com/2013/02/06/how-to-run-gui-apps-as-root-in-mac-os-x/


### Show hidden files in Open dialog

```
# Must be done in List view, not Column view!
Cmd + Shift + .
```

http://apple.stackexchange.com/questions/114628/display-hidden-files-hot-key-on-mavericks-gone


### Go to Folder in Finder / Open Folder in Finder

```
Shift + Cmd + G
```

http://superuser.com/questions/44086/open-folder-for-a-given-path-in-mac-os-x
http://www.alexandre-gomes.com/?p=376


### Launch iOS app on device

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

Try deleting the entry containing "localhost" from `~/.ssh/known_hosts`.


### Rotate screen

System Preferences -> Cmd + Option + click Display --> Rotation option should appear


### Bulk Rotate Pictures

* Select all pictures, Cmd + O to open in Preview
* Cmd + R/L to rotate
* Cmd + S to save all changes.

http://osxdaily.com/2012/05/11/batch-rotate-a-group-of-images-with-preview-for-mac-os-x/


### Stop program from auto-opening when you plug in iPhone

Open Image Capture - click triangle in bottom left corner, select don't open any program when phone is connected.

https://www.macworld.co.uk/how-to/iphone/stop-itunes-photos-opening-automatically-3629261/


### Image Capture not showing iPhone photos

Restart iPhone, restart Mac.

https://forums.macrumors.com/threads/help-image-capture-not-recognizing-iphone-on-el-capitan.1929511/


### Open iPhone photos in Finder

Use Image Capture to export to a folder, which you can then open in Finder.

Image Capture only shows pictures in Camera Roll, not screenshots or other photos.

https://discussions.apple.com/thread/6776330?start=0&tstart=0


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


### Make square image

Open in Preview -> selection tool, hold Shift while selecting.

http://www.cultofmac.com/95739/how-to-crop-any-image-to-a-perfect-square-using-preview-100-tips-54/


### Adjust Picture Size
Batch resize
```
# resizes all images in-place to 800 pixels max length/width, preserving aspect ratio
sips -Z 800 *.JPG
```
http://lifehacker.com/5962420/batch-resize-images-quickly-in-the-os-x-terminal


Preview -> Tools -> Adjust Size
http://www.wikihow.com/Resize-Pictures-(for-Macs)

Batch resize with Preview: http://osxdaily.com/2009/12/16/batch-resize-images-on-mac-with-preview/


### Send iMessages from Mac

Make sure you have have enabled your Mac in Settings -> Message -> Message Delivery


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