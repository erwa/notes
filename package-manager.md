### See package installation and uninstallation scripts

```
rpm -qp --scripts foo.rpm
```

https://www.cyberciti.biz/faq/rhel-list-package-specific-scriptlets/


### List files in RPM / see RPM contents

```
rpm -qpl foo.rpm
```


### Extract files in RPM

```
rpm2cpio foo.rpm  | cpio -idmv
```

https://superuser.com/questions/209808/how-can-i-install-an-rpm-without-being-root


### Refresh repos

```
sudo yum clean expire-cache
```

https://forums.fedoraforum.org/showthread.php?202402-How-to-refresh-yum


### Clear Yum cache

May be necessary if you do not see a new RPM you just added.

```
sudo yum clean all
```


### Determine which repos contain package

```
sudo yum list PACKAGE
```


### List packages available in Yum repo

```
sudo yum --disablerepo="*" --enablerepo="NAME_OF_REPO" list available
```


### Download RPM without installing

```
sudo yum install downloadonly
sudo yum install --downloadonly --downloaddir=<directory> <package>
# default downloaddir is
# /var/cache/yum/.../<repo>/packages/
```

https://access.redhat.com/solutions/10154
https://superuser.com/questions/385712/where-does-yum-save-the-rpm-files-it-downloads


### Get RPM URL for Yum package

```
sudo yumdownloader --urls mariadb-server
```

https://unix.stackexchange.com/questions/85715/how-do-i-find-package-urls-with-yum


### List all Yum repositories

```
sudo yum repolist
# For more info, like URL, add -v
```

http://www.cyberciti.biz/faq/centos-fedora-redhat-yum-repolist-command-tolist-package-repositories/


### See yum package dependencies

```
sudo yum deplist perl-Time-HiRes
```

https://superuser.com/questions/294662/how-to-get-list-of-dependencies-of-non-installed-rpm-package


### Add a Yum Repository on RHEL

See https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/sec-Managing_Yum_Repositories.html.

```
sudo yum-config-manager --add-repo http://yum.postgresql.org
```


### Install RPM file

http://www.cyberciti.biz/faq/rhel-redhat-fedora-opensuse-linux-install-rpmfile-command/

```
sudo rpm -ivh RPM_FILE
# -i for install
# -h for printing hash marks to indicate progress
# -v for verbose
```


### Install all RPM files in a directory

```
for i in /path/to/rpms/*.rpm; do
  sudo rpm -ivh $i
done
```


### Determine where Yum package was installed / list files in package

http://stackoverflow.com/questions/1766380/determining-the-path-that-a-yum-package-installed-to

```
rpm -ql PACKAGE
```


### List all installed RPMs

```
rpm -qa
```


### Delete RPM package

https://www.howtoforge.com/community/threads/how-do-i-uninstall-rpm-packages.8/

```
yum erase <package_name>

# Find exact package name
rpm -qa | grep -i package_name

# Uninstall it
sudo rpm -e <package name>
```