### Upgrade working copy

Run `svn upgrade` in the directory containing the `.svn/wc.db` folder.

http://stackoverflow.com/questions/7992034/svn-upgrade-working-copy


### `svn blame`

See revision and author for each line.

```
svn blame FILE
# Add -v for date

# at specific revision
svn blame FILE@r123
# http://svnbook.red-bean.com/en/1.7/svn.ref.svn.c.blame.html
```


### Diff revision with working copy

```
svn diff -r 12345 <file/folder>
```
http://stackoverflow.com/questions/2376309/how-can-i-find-the-svn-diff-between-working-copy-and-arbitrary-rev


### See changes in revision / commit

```
svn diff -c <revision> path/to/file
# -c means changeset

# see only list of files changed
# -v == --verbose
svn log -v -rXXX
```

http://stackoverflow.com/questions/21720865/how-to-view-changes-made-to-files-on-a-certain-revision-in-subversion


### Check out a repo

```
svn checkout svn+ssh://<host>/repo/path
```

### Check out folder and all its immediate contents without recursing

```
svn checkout --depth immediates svn+ssh://<host>/repo/path
```

### Check out folder and all its files (but not directories)

```
svn checkout --non-recursive svn+ssh://<host>/repo/path
```

### Partial checkout and then add additional files as needed

```
svn checkout --depth empty http://svnserver/trunk/proj
svn update --set-depth infinity proj/foo
svn update --set-depth immediates proj/bar
svn update --set-depth empty proj/bar/a
svn update --set-depth empty proj/bar/a/b
```
http://stackoverflow.com/questions/50945/can-you-do-a-partial-checkout-with-subversion

* The first time you use `--depth`, it sets a default depth.
* To override the default depth, use `--set-depth`.
* http://svnbook.red-bean.com/en/1.6/svn.advanced.sparsedirs.html

### Svn merge/update output explanation

```
A  Added
D  Deleted
U  Updated
C  Conflict
G  Merged
```
http://stackoverflow.com/questions/2634300/what-do-the-different-columns-of-letters-mean-for-the-svn-merge-output

### Discard changes to file

```
svn revert <file>
```
http://stackoverflow.com/questions/9463695/how-to-discard-local-changes-svn

### Creating and applying a patch/diff

```
svn diff > patch
patch -p0 -i patch
```
https://ariejan.net/2007/07/03/how-to-create-and-apply-a-patch-with-subversion/

### Resolve a conflict

```
svn resolved <file>
```

### See commit history

```
# All history
svn log

# Last 3 revisions to FILE
svn log -l3 FILE
```
http://stackoverflow.com/questions/9536476/how-to-get-a-list-of-all-recent-svn-commit-messages

### See revision of file

```
svn info FILE
```
http://stackoverflow.com/questions/579196/getting-the-last-revision-number-in-svn


### Checkout specific revision of file

```
svn up -r XXXX FILE
```
http://stackoverflow.com/questions/2812901/reverting-single-file-in-svn-to-a-particular-revision


### Print most recent revision

```
# or --limit 1
svn log -l 1
```

https://stackoverflow.com/questions/2675749/how-do-i-see-the-last-10-commits-in-reverse-chronoligical-order-with-svn


### See log info for specific revision

```
svn log -r REVISION
```

http://stackoverflow.com/questions/14555944/svn-is-it-possible-to-get-svn-info-for-a-given-revision-number-of-a-branch


### Status

```
svn st
```

http://svnbook.red-bean.com/en/1.7/svn.ref.svn.c.status.html


### Add file

```
svn add PATH/TO/FILE
```