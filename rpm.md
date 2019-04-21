### Install RPM

```
sudo yum install foo.rpm
```


### Extract file from RPM

```
# -i for extract
# -d for make directories
# -m for preserve modification time
# -v for verbose
rpm2cpio foo.rpm | cpio -idmv
```

https://blog.packagecloud.io/eng/2015/10/13/inspect-extract-contents-rpm-packages/


### List files in RPM

```
rpm -qlp foo.rpm
```

https://blog.packagecloud.io/eng/2015/10/13/inspect-extract-contents-rpm-packages/


### Download but don't install RPM

```
yumdownloader foo_package
```

https://access.redhat.com/solutions/10154


### Uninstall RPM

```
# Uninstalls package installed with
# rpm -i foo.rhel6.rpm
rpm -e foo
```


### `%files`

What gets included in the RPM.

http://ftp.rpm.org/max-rpm/s1-rpm-build-creating-spec-file.html


### `%defattr`

Sets default permissions, default user id, default group id.

https://stackoverflow.com/questions/6952384/what-does-defattr-mean-in-rpm-spec-files


### See also

[package-manager.md](package-manager.md)


### Spec file explanation

http://ftp.rpm.org/max-rpm/s1-rpm-build-creating-spec-file.html