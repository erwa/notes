# Move window to other workspace
Ctrl + Shift + Alt + <arrow>

# ls rwt permission explanation
# http://www.linuxmisc.com/14-unix-administering/0de909bb7469bba9.htm
# 't' means sticky bit
# Sticky bit means folder can only be deleted by owner and root user,
# even if other users have write permissions

# Edit RHEL menu bar
See `/usr/share/applications` or `/usr/local/share/applications`. Referenced in `/etc/xdg/menus/applications.menu`. Copy an existing `.desktop` file and modify it. Example:
```
[Desktop Entry]
Encoding=UTF-8
Name=Eclipse SDK 4.4.1
Comment=Eclipse SDK 4.4.1
Exec=/export/apps/xtools/eclipse-4.4.1/eclipse
Terminal=false
Type=Application
Icon=/export/apps/xtools/eclipse-4.4.1/icon.xpm
StartupNotify=true
Categories=Development;IDE;
X-Desktop-File-Install-Version=0.15
```

References:
* http://www.centos.org/docs/4/html/rhd-dg-en-4/ch-ddg-menus.html
* http://www.techotopia.com/index.php/Configuring_the_RHEL_6_Desktop_Menu_System

### Virtual Console
Ctrl + Alt + F2 to switch to virtual console. Ctrl + Alt + F1/F7/F8 (depending on system) to switch back.

### Open folders in same window
http://srinisboulevard.blogspot.com/2010/04/how-to-open-linux-folders-in-same.html
Edit -> Preferences -> Behavior -> Always open in browser windows