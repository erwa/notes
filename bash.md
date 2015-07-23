### `if` Expressions
See http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html.
```bash
[ -f FILE ] # true if FILE exists and is regular file (not directory of link)
[ -e FILE ] # true if FILE exists
[ -z STRING ] # true if STRING is of length 0
[ -n STRING ] or [ STRING ] # true if length of STRING is non-zero
[ STRING1 == STRING2 ] # true if two strings are equal
[ STRING1 != STRING2 ] # true if two strings are not equal
[ $# < 1 ] # true if no arguments passed to script
[ ! EXPR ] # true if EXPR is false
```

Example:
```
if [ -f /var/log/messages ]
then
  echo "/var/log/messages exists."
fi
```

### Test if string contains another string
See http://stackoverflow.com/questions/229551/string-contains-in-bash.
```
string='My long string';

if [[ $string == *"My long"* ]]
then
  echo "It's there!";
fi
```

### See current memory usage
```
free
top
```

### Swap space
See http://www.linux.com/news/software/applications/8208-all-about-linux-swap-space.

Check `vm.swappiness` in `/etc/sysctl.conf`. Default is `60`. To verify:
```
sysctl vm.swappiness
```
A higher number means the system is more likely to swap pages out into swap space.

# `grep`

Grep only files matching a pattern:
```
grep --include=*.job -r "type=hive" ./*
```

Grep and only show matching files:
```
grep -l
```
* http://stackoverflow.com/questions/3908156/grep-output-to-show-only-matching-file

Grep for classes with "Test" in their names. See http://www.robelle.com/smugbook/regexpr.html.
```
grep Test.*class
```
NOTE: `grep Test*.class` and `grep Test*class` do NOT work as expected.

Grep for files ending in .xml:
```
grep "\.xml"
```

Grep for items that do NOT match a pattern:
```
grep -v <pattern>
```

Grep starting from certain line number:
```
sed -n '<line_number>,$ p' <file> | grep <pattern>
```

Grep and only print the second field:
```
grep -r "pattern" ./* | cut -d ' ' -f 2
```
`-d ' '` means split on space. `-f 2` means select only the 2nd field.

Grep, split on whitespace, and print fifth field:
```
grep "pattern" | awk '{print $5}'
```

Grep matching the beginning of lines:
```
grep '^<pattern>'
```

Grep number of occurrences of WORD in FILE
```
grep -o WORD FILE | wc -l
```
`-o` causes grep to only print matching part (not entire line)

Grep and ignore errors
```
grep -s ...
```

### Use awk to find 0-byte HDFS files in a directory
You may need to add a `grep` to exclude directories (which are also 0 bytes):
```
hadoop fs -ls <dir> | awk '{ if ($5 == 0) print $8 }'
```
To delete these 0-byte files, do:
```
hadoop fs -ls <dir> | awk '{ if ($5 == 0) print $8 }' | xargs hadoop fs -rm
```

### See members of a group
```
getent group <groupname>
```

# Archiving/Unarchiving
Zip/unzip folder:
```
zip -r foo.zip foo
unzip foo.zip
```

Unzip one file:
```
unzip foo.zip file
```

Unzip one file to standard out:
```
unzip -p foo.zip file
```

List files in a zip:
```
zipinfo foo.zip
unzip -l foo.zip
```

Remove a file from a zip:
```
zip -d foo.zip file
```

Extract gunzip'd .gz file to specified file:
```bash
gzip -c -d file.gz > file.out
```
`-c` is equivalent to `--stdout`. `-d` is equivalent to `--decompress`.

Show files in tar/tarball/tar.bz2:
```bash
tar -tvf file.tar
tar -ztvf file.tar.gz
tar -jtvf file.tar.bz2
```

Extract .tar file to different directory:
```bash
tar -xf archive.tar --directory=/target/directory
```

Tar but exclude some directories:
```bash
tar cvzf file.tar.gz  --exclude 'dir/a/*' --exclude 'dir/b/*' dir
```

Extract one file from tarball to standard out:
```bash
tar -Oxzf tarball.tar.gz path/to/file
```

### cd to previous directory
```bash
cd -
```

### Substrings

See:
* http://stackoverflow.com/questions/428109/extract-substring-in-bash
* http://tldp.org/LDP/abs/html/string-manipulation.html

#### Substring using string manipulation
```
$ word="abcde"
$ echo ${word:0:3}
abc
```

#### Substring using cut
```
$ word="abcde"
$ echo $word | cut -c 1-3
abc
```

#### Substring removal
See http://wiki.bash-hackers.org/syntax/pe#substring_removal.

Remove last character from substring:
```bash
${MYSTRING%?}
```
`%` (percent) matches from the end. `?` matches any character. See http://wiki.bash-hackers.org/syntax/pattern.

### Schedule a cron job
```bash
crontab -e
```
See http://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/. The crontab is stored in `/var/spool/cron/`, but is not meant to be edited by hand. See http://askubuntu.com/questions/216692/where-is-the-user-crontab-stored. To see recent cron job runs, run:
```bash
grep <script_name> /var/log/cron
```

# Bash dollar sign variables
See http://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables.
```bash
$1, $2, $3 # positional parameters
$@ # array representation of positional parameters
$# # number of parameters
$* # IFS (Internal Field Separator) expansion
$- # current shell options
$$ # pid of current shell
$_ # most recent parameter
$IFS # input field separator
$? # most recent foreground exit status
$! # PID of most recent background command
$0 # name of shell or shell script
```

# Bash Bang commands and related stuff
See http://ss64.com/bash/bang.html. `Alt + .` prints out the last word of the last command.
```
!! # run last command again
!foo # run most recent command starting with foo
!foo:p # !foo dry run, adds !foo to command history
!$ # last parameter of the last command
^foo^bar # run last command replacing foo with bar
```

### Clear history
See http://askubuntu.com/questions/191999/how-to-clear-bash-history-completely.
```
history -c && history -w # clear current history, then write empty history to ~/.bash_history
```

### Set/modify/remove/see user-specific ACLs:
```
setfacl -m user:<user>:rwx <file>
setfacl -x <user> <file> # Remove <user> from <file>'s ACL list
setfacl --remove-all <file> # Remove all ACLs for a file
setfacl --remove-default <file> # Remove default ACLs
getfacl <file>
```

A user needs execute permissions on a directory to `cd` into it. Even if a file is 777, a user still needs permissions on the chain of parent directories to access the file.

# `xargs`
With substitution:
```
cat temp | xargs -I 'TABLE' hive -e 'drop table TABLE'

find . -name *.jar | grep hadoop- | grep -v tests | grep -v sources | xargs -n1 -I% scp % $ANOTHER_MACHINE:hadooptest
```

One argument per command line:
```
find . -name *.jar | xargs -n 1 jar tf
```

Substitute in multiple places:
```
find . -name *.jar | grep PATTERN1 | xargs -n1 -I% sh -c 'echo % && jar tf % | grep PATTERN2'
```
`-I%` tells `xargs` to replace `%` with the arguments passed in. See http://stackoverflow.com/questions/18731610/xargs-with-multiple-commands for details.


### Apply a patch, but strip off leading a/ and b/
If your patch file `patch.diff` looks like
```
diff --git a/file b/file
...
```
to apply as if the diff looks like
```
diff --git file file
...
```
use
```
patch -p1 < patch.diff
```

### Apply part of a patch (changes to only one file)
```
patch FILE PATCH
```

### Extract diffs concerning specific files from a diff
```
filterdiff -i '*file' patch.diff > filtered.diff
```

One issue with `filterdiff -i` is it removes any `diff --git ...` and `index ...` lines. To avoid this, you can use `filterdiff -x` or `filterdiff -X`. However, it does not exclude new and deleted files:
```
filterdiff -X fileWithExcludePatternsOnePerLine patch.diff > filtered.diff
```

# `ls`

### `ls` color output
Add the following to your .bashrc to enable color ls output by default:
```
alias ls="ls --color=auto"
```

### ls everything on one line
```
ls | tr "\\n" " "
```

### ls: output one file per line
```
ls | cat
```

### List directories only
```
ls -d */
tree -d
```

### List files only
```
find . -maxdepth 1 -type f
```
From http://stackoverflow.com/questions/10574794/bash-how-to-list-only-files.


### ls: Show extended attributes
This is an OSX-only feature:
```
ls -l@
```
To show the value of extended attributes, use
```
xattr -l <filename>
```

### ls output explained
See http://unix.stackexchange.com/questions/103114/what-do-the-fields-in-ls-al-output-mean. The first character is the file type. See http://unix.stackexchange.com/a/103117. `c` means character special file, which behave like pipes and serial ports. Writing to them causes an immediate action, like displaying something on the screen or playing a sound. See http://unix.stackexchange.com/questions/60034/what-are-character-special-and-block-special-files-in-a-unix-system.

### Check disk usage, output in human-readable format:
```
df -h
```

### Check disk usage of a directory, output in human-readable format:
```
du -h DIR
```

### du of every file/directory (including hidden ones) in current directory, sort from largest to smallest:
See http://askubuntu.com/questions/356902/why-doesnt-this-show-the-hidden-files-folders.
```
du -sh  .[!.]* * | sort -hr
```

# `date`

### Date in `yyyyMMdd` format
```
date +%Y%m%d
```

### Date one day ago (only works on Linux)
```
date --date="1 day ago" +%Y%m%d
```

### Seconds since epoch:
```
date +%s
```

### Milliseconds since epoch:
```
date +%s%3N
```

### Date in different timezone
```
TZ=America/Los_Angeles date
```

---

### Redirect both stdout and stderr to the same file
See http://www.gnu.org/software/bash/manual/bashref.html#Redirecting-Standard-Output-and-Standard-Error.
```
<command> &> file
```

### Look up hostname/IP address associated with IP address/hostname
```
nslookup <ip_address>
nslookup <hostname>
```

### `echo` string with escape characters
`$''` causes escape sequences to be interpreted.
```
echo $'a\tb'
```

### Print current machine name
```
hostname
```

### Check system specs (CPU, memory, etc.)
```
cat /proc/cpuinfo
cat /proc/meminfo
```

### Print operating system information
```
uname -a
```

### Append to a file
```
cat <file1> >> <file2>
```

### Use default language for output, force sorting to be bytewise
See http://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do.
```
LC_ALL=C
```

### `rsync` example:
```
rsync -az
```
`-a` means "archive" mode, which preserves symbolic links, permissions, etc. `-z` enables compression for the data transfer.


### Run command only if previous command succeeded (exit status of 0) or failed
See http://stackoverflow.com/questions/7402587/run-command2-only-if-command1-succeeded-in-cmd-windows-shell.
```
command1 && command2
command1 || command2
```

### Stop a script if a command or pipeline has an error
See http://stackoverflow.com/questions/19622198/what-does-set-e-in-a-bash-script-mean.
```
set -e
```

# less

### Open a large file
```
less <file>
```
For a long line, press `<right-arrow>` to show more of the line.

To highlight/unhighlight search results, type `<Esc, u>`.

### Scroll N lines forward/backward
```
10j – 10 lines forward.
10k – 10 lines backward.
```
http://www.thegeekstuff.com/2010/02/unix-less-command-10-tips-for-effective-navigation/

### Turn word wrap on/off in less
See http://superuser.com/questions/272818/how-to-turn-off-word-wrap-in-less
```
-, Shift-S
```

### Jump to line number
See http://stackoverflow.com/questions/8586648/going-to-a-specific-line-number-using-less-in-unix
```
ng # jump to line `n`
-N # turn line numbers on/off
```

### Search forward
```
/pattern
```

### Search backward
```
?pattern
```

### Print full path of file
NOTE: This does not work on Mac/BSD bash:
```
# This also follows symbolic links.
readlink -f <file>
```

### See login times
```
last
```

### true/false
`0` is true, `1` is false. See http://stackoverflow.com/questions/3924182/how-the-keyword-if-test-the-value-true-of-false. Exit codes of commands are evaluated. `0` is true, `1` is false.

### `[]` vs. `[[]]` (square brackets vs. double square brackets)
See http://stackoverflow.com/questions/13542832/bash-if-difference-between-square-brackets-and-double-square-brackets. `[[]]` is an extension to `[]` and supports some extra conditional expressions.

### Fall back to default value when variable is not set
See http://stackoverflow.com/questions/2013547/assigning-default-values-to-shell-variables-with-a-single-command-in-bash.
```
FOO=${VARIABLE:-default}
```

### Use value of `<parameter>` as variable name and then evaluate variable
```
${!parameter}
```
Suppose `$parameter` is `JAVA_HOME`, then `${!parameter}` is `${JAVA_HOME}`.

### Bash prompt appearance
`PS1` environment variable can be used to control the appearance of the Bash prompt. See http://ss64.com/bash/syntax-prompt.html.
```
export PS1="My simple prompt> "
```

### See quota for a user
```
quota -s ahsu
```

### Find process running on port
```
sudo netstat -tulpn | grep <port>
```
* `-t` means TCP.
* `-u` means UDP.
* `-l` means show only listening sockets.
* `-p` means show the PID and program using the socket/port.
* `-n` means show numerical addresses instead of symbolic host/port/username.

On a Mac, use:
```
netstat -anp tcp | grep <port>
```
* `-a` means show the state of all sockets, including server process sockets.
* `-n` means show network addresses as IP addresses instead of using domain names.
* `-p tcp` means show stats for the TCP protocol.

### See keyboard shortcut bindings
```
bind -P
```

### Delete to previous slash
```
Esc, Ctrl-h
```

### Test if remote port is open
See http://stackoverflow.com/questions/4922943/how-to-test-if-remote-tcp-port-is-opened-from-shell-script.
```
nc -z -w5 <host> <port>
```
* `-z` means scan for listening daemons without sending any data.
* `-w5` sets timeout to 5 seconds.
This will print a message if successful:
```
echo $? # 0 on success, 1 on failure
```

### Add a Yum Repository on RHEL
See https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/sec-Managing_Yum_Repositories.html.
```
sudo yum-config-manager --add-repo http://yum.postgresql.org
```

### Install RPM file
http://www.cyberciti.biz/faq/rhel-redhat-fedora-opensuse-linux-install-rpmfile-command/
```
rpm -ivh RPM_FILE
```

### Install all RPM files in a directory
```
for i in /path/to/rpms/*.rpm; do
  sudo rpm -ivh $i
done
```

### Determine where Yum package was installed
http://stackoverflow.com/questions/1766380/determining-the-path-that-a-yum-package-installed-to
```
rpm -ql PACKAGE
```

### Find out when computer was last rebooted.
See http://www.ehow.com/how_5915486_tell-last-time-computer-rebooted.html.
```
uptime
```
The time after `up` is how long the computer has been running without reboot

### Read first few lines of a file
```
head FILE
```

### Setting PKG_CONFIG_PATH for pkg-config
There should be .pc files in the `PKG_CONFIG_PATH`.
```
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
```

### Get ./configure help
```
./configure --help
```

### Parcellite
Cycle through clipboard:
```
Ctrl + Alt + H, arrow keys, Enter
```

### Convert string to lowercase
```
$ string="A FEW WORDS"
$ echo ${string,}
a FEW WORDS
$ echo ${string,,}
a few words
$ echo ${string,,[AEIUO]}
a FeW WoRDS
```

### Print folder tree / directory structure
```
tree DIR
tree -d DIR # print directories only

# Exclude some files
tree -f -I build
# http://unix.stackexchange.com/questions/61074/tree-command-for-multiple-includes-and-excludes
```

### Extract filename and extension
See http://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash.
```
extension="${filename##*.}"
filename="${filename%.*}"
```
* `##` is greedy match and removal from beginning.
* `%` matches and removes from the end.

### `cut` on whitespace
```
tr -s ' ' | cut -d ' ' -f 4
```
`-s` means `--squeeze-repeats`, which means to replace repeated instances of the character with a single instance.

### Send mail from command line
```
mailx -s "Testing mailx" -a testattachment EMAIL_ADDRESS_1,EMAIL_ADDRESS_2
BODY_OF_MESSAGE
<Ctrl+D>
```

### List input devices
```
xinput list
lsusb
```

### Figure out your mouse buttons
```
xev | grep button
# Click around in pop-up window
```

# Screen

Show sessions:
```
screen -ls
```

Detach Screen window:
```
Ctrl + a, d
```

Reattach Screen window:
```
screen -r

screen -r <session>
```

Kill session:
```
# -X sends a command
# -S SESSION specifies the session
screen -X -S SESSION quit
```

### Download file using `curl`
```
curl http://example.com > example.txt
```

### MOTD (Message of the Day)
Check out `/etc/motd`.


### Print all except first line
```
tail -n +2
```
See http://stackoverflow.com/questions/3507999/whats-the-opposite-of-head-i-want-all-but-the-first-n-lines-of-a-file.

### Print columns of file in different order
```
awk '{ print $4 " " $1 " " $5 }' FILE
```
See http://stackoverflow.com/questions/2129123/rearrange-columns-using-cut.

### Remove trailing slash
```
sed 's/\/$//'
```
See http://stackoverflow.com/questions/9044465/list-of-dirs-without-lates.

### Replace string in all files
```
sed -i 's/old-word/new-word/g' *.txt
```
See http://www.cyberciti.biz/faq/unix-linux-replace-string-words-in-many-files/.

### Check for existence of executable
See http://stackoverflow.com/a/677212/1128392.
```
if [ command -v java >/dev/null 2>&1 ]; then
  ...
fi
```

### Match digit or other character classes
```
ls -ld [[:digit:]]*
```
http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_04_03.html#sect_04_03_02
