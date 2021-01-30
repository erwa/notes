### Find and replace

```
# Portable
find . -name pom.xml -exec perl -pi -w -e 's/foo/bar/g' {} \;

find /path/to/files -type f -exec sed -i 's/oldstring/new string/g' {} \;
```

http://stackoverflow.com/questions/15402770/how-to-grep-and-replace


### List files only

```
find . -maxdepth 1 -type f
```

From http://stackoverflow.com/questions/10574794/bash-how-to-list-only-files.


### Find and exec

```
find . -name "test_*.py" -exec {} \;
```
http://stackoverflow.com/questions/7719785/using-find-with-exec-is-there-a-way-to-count-the-total


### Find and suppress permission denied errors

```
find . ! -readable -prune
```

http://stackoverflow.com/questions/762348/how-can-i-exclude-all-permission-denied-messages-from-find


### Find but exclude directories

```
find . -not -path "./dir/to/exclude/*"
find . -path ./dir/to/exclude -prune -o -print
find \( -name "*.ml" -o -name "*.mli" \) -not -path "./_build/*" -not -path "./log/*"
```

http://stackoverflow.com/questions/4210042/exclude-directory-from-find-command
