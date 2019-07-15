### Working directory of running process

```
pwdx <PID>
```

https://unix.stackexchange.com/questions/94357/find-out-current-working-directory-of-a-running-process


### Determine CPU architecture

```
gcc -march=native -Q --help=target | grep march
```

https://unix.stackexchange.com/questions/230634/how-to-find-out-intel-architecture-family-from-command-line


### Lock screen

Super + L

https://askubuntu.com/questions/126782/keyboard-shortcut-for-lockscreen-not-working


### Total number of threads running on system

```
# nlwp = Number of LightWeight Processes
ps -eo nlwp | tail -n +2 | awk '{ num_threads += $1 } END { print num_threads }'
```

https://askubuntu.com/questions/88972/how-to-get-from-terminal-total-number-of-threads-per-process-and-total-for-al


### Print kernel ring buffer messages

```
dmesg | grep -i nvidia
```

https://forum.manjaro.org/t/solved-nvidia-modeset-error-gpu-idling-display-engine-timed-out/49762/7


### PAM (Pluggable Authentication Module)

https://www.linux.com/news/understanding-pam

Four management realms:
* auth
* account
* password
* session


### Check memory of running process

```
cat /proc/<pid>/status  # look at VmSize
```

https://stackoverflow.com/questions/131303/how-to-measure-actual-memory-usage-of-an-application-or-process


### Check mount filesystem of path

```
df -h /path/to/dir
```


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


### Move window to other workspace

Ctrl + Shift + Alt + <arrow>


### ls rwt permission explanation

http://www.linuxmisc.com/14-unix-administering/0de909bb7469bba9.htm

* 't' means sticky bit
* Sticky bit means folder can only be deleted by owner and root user,
* even if other users have write permissions


### Edit RHEL menu bar

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


### Boot into terminal

On boot menu, type 'e'. On `linux16` line, change `ro` to `rw init=/sysroot/bin/sh`. Press Ctrl-X. Mount root filesystem by running `chroot /sysroot/`. Do what you need to. Then `reboot -f`.

https://www.tecmint.com/boot-into-single-user-mode-in-centos-7/


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


### Take screenshot

Shift + Print Screen to select area to screenshot.

Screenshots saved to ~/Pictures.

https://www.wikihow.com/Take-a-Screenshot-in-Linux


### Install Shutter Screenshot Editor

http://shutter-project.org/downloads/third-party-packages/

```
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-1.el6.nux.noarch.rpm
sudo yum install shutter
```
