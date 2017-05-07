### Check filesystem type
```
df -T
```
https://unix.stackexchange.com/questions/53313/how-to-show-the-filesystem-type-via-the-terminal


### SHA1 of file
```
# Linux
sha1sum FILE
```


### Print operating system information
```
cat /etc/redhat-release

# or

uname -a
```
http://serverfault.com/questions/188037/how-do-i-determine-what-version-of-red-hat-enterprise-linux-my-server-is-running

See https://en.wikipedia.org/wiki/Red_Hat_Enterprise_Linux#RHEL_6 for what kernel version maps to what 6.x version.


### Check RHEL version
```
lsb_release -sd
```


### RHEL Versions

See https://en.wikipedia.org/wiki/Red_Hat_Enterprise_Linux#RHEL_6 for what kernel version maps to what 6.x version.


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
Ctrl + Alt + F2 to switch to virtual console. Ctrl + Alt + F1/F7/F8 (depending on system) to switch back. Or use Alt + Left/Right to cycle through terminals.

https://askubuntu.com/questions/277517/what-does-ctrl-alt-f12-do
http://superuser.com/questions/308657/is-there-a-limit-to-virtual-console-ttys-in-linux-based-oses


### Open folders in same window
http://srinisboulevard.blogspot.com/2010/04/how-to-open-linux-folders-in-same.html
Edit -> Preferences -> Behavior -> Always open in browser windows


### Delete RPM
```
# -e = --erase
sudo rpm -e foo  # omit version and .rpm
```


### Install RPM from local file
```
# -i = --install
# -h = --hash (print hash marks as package installs)
# -v = --verbose
sudo rpm -ivh foo.rpm
```


### Install Shutter Screenshot Editor
http://shutter-project.org/downloads/third-party-packages/
```
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-1.el6.nux.noarch.rpm
sudo yum install shutter
```