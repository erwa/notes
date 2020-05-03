### Resume stopped process

```
# stop process
Ctrl-Z

# resume
fg
```

https://stackoverflow.com/questions/1879219/how-to-temporarily-exit-vim-and-go-back


### Print calendar

```
cal
```

https://www.cyberciti.biz/faq/howto-displays-calendar-date-of-easter/


### Sort by column

```
cat foo.txt | sort -k 3  # sort by third column
```

https://unix.stackexchange.com/questions/104525/sort-based-on-the-third-column


### Print nth line of file

```
# replace N with line
head -N file | tail -1

# NUM is line number (possibly faster for giant file)
sed 'NUMq;d' file
```

https://stackoverflow.com/questions/6022384/bash-tool-to-get-nth-line-from-a-file


### Sort lines of file by length

```
cat testfile | awk '{ print length, $0 }' | sort -n | cut -d" " -f2-
```

https://stackoverflow.com/questions/5917576/sort-a-text-file-by-line-length-including-spaces


### Print length of each line in file

```
awk '{ print length }' abc.txt
```

https://stackoverflow.com/questions/8786634/how-to-print-the-number-of-characters-in-each-line-of-a-text-file


### Check max length of line in file

```
wc -L my_file
```

http://www.cs.cmu.edu/afs/cs/academic/class/15513-m19/www/codeStyle.html


### Array literal / append to array

```
ARRAY=()
ARRAY+=('foo')
ARRAY+=('bar')
```

https://stackoverflow.com/questions/1951506/add-a-new-element-to-an-array-without-specifying-the-index-in-bash


### Intersection of two files

```
comm -12  file1 file2
```

https://stackoverflow.com/questions/2696055/intersection-of-two-lists-in-bash


### Pipe both stderr and stdout

```
<command> |& <command>
```

Syntactic sugar for `2>&1 |` in Bash. Introduced in Bash 4.0.

https://stackoverflow.com/questions/16497317/piping-both-stdout-and-stderr-in-bash/37085215#37085215


### Restart machine

```
sudo /sbin/shutdown -r now
```

http://tldp.org/LDP/lame/LAME/linux-admin-made-easy/system-shutdown-and-restart.html


### Get info about a command

```
# command here is actually the name of a <command>!
help command
```

https://askubuntu.com/questions/512770/what-is-use-of-command-command


### Parameter Substitution

```
# Replace first occurrence of PATTERN with STRING or empty string
${PARAMETER/PATTERN/STRING}
${PARAMETER/PATTERN}

# Replace all occurrences of PATTERN with STRING or empty string
${PARAMETER//PATTERN/STRING}
${PARAMETER//PATTERN}
```

http://wiki.bash-hackers.org/syntax/pe#search_and_replace


### Bash function

```
function print_something() {
  echo Hello $1
}
```

https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php


### Run command for each line of a file

```
cat temp | while read in; do host "$in"; done
```

https://stackoverflow.com/questions/13939038/how-do-you-run-a-command-for-each-line-of-a-file


### SHA256

```
# Linux
sha256sum /path/to/file

# Mac OS
shasum -a 256 /path/to/file
```

https://stackoverflow.com/questions/3358420/generating-a-sha256-from-the-linux-command-line


### Less than Less than parentheses (`< <(...)`), Process Substitution

`<(...)` basically runs a command and captures the output as a file-like object.

```
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
```

`bash -s stable < <(curl ...)`

is equivalent to

```
curl ... > something
bash -s stable < something
```

https://superuser.com/questions/404780/what-bash-syntax-mean
http://tldp.org/LDP/abs/html/process-sub.html

```
diff <(ls $first_directory) <(ls $second_directory)
```


### Brace expansion

```
cp -v file1.txt{,.bak}
# is equivalent to
cp -v file1.txt file1.txt.bak

mv foo{.bak,}
# is equivalent to
mv foo.bak foo
```

https://www.cyberciti.biz/faq/explain-brace-expansion-in-cp-mv-bash-shell-commands/


### Pretty-print JSON

```
# JSON already in file
python -m json.tool my_json.json

# pipe to pretty-print
echo '{"foo": "lorem", "bar": "ipsum"}' | python -m json.tool
```

https://stackoverflow.com/a/1920585/1128392


### Get absolute path of current script

```
SCRIPTPATH=$( cd $(dirname $0) ; pwd )
```

https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself


### Find file by name quickly

```
locate libffi
```


### wget download to specific directory

```
wget URL -P my_dir
```

http://stackoverflow.com/questions/1078524/how-to-specify-the-location-with-wget


### Do math / arithmetic

```
$ expr 1 + 1
2

# floating-point arithmetic (not supported natively in Bash)
$ awk "BEGIN {print 208955300 / 15892428}"
13.1481
```

https://www.shell-tips.com/2010/06/14/performing-math-calculation-in-bash/


### Sum stream of numbers

```
# split on space, take 11th field, remove comma, sum
cat MY_FILE | cut -d ' ' -f 11 | sed 's/,//' | awk '{s+=$1} END {print s}'
```

http://stackoverflow.com/questions/450799/shell-command-to-sum-integers-one-per-line


### Sort lexicographically

```
LC_ALL=C sort
```

https://superuser.com/questions/631402/sort-lexicographically-in-bash


### Sort by version number

```
sort -V

# Example output
0.1.0
0.1.1
0.1.2
0.1.10
```


### `ps` output explained

```
# -f prints uid, pid, parent pid, ...
ps -ef
```

https://superuser.com/questions/117913/ps-aux-output-meaning


### Find process start-time

Get process id using `ps -ef`. Then use `ps -eo pid,cmd,lstart | grep <pid>`.

http://stackoverflow.com/questions/5731234/how-to-get-the-start-time-of-a-long-running-linux-process


### Remove newlines from string

```
echo "STRING
WITH
NEWLINES" | tr '\n' ' '
```


### Print file, replacing `\n` with actual newlines

```
echo -e $(cat filename)
```


### Delete empty lines

```
sed '/^\s*$/d'
```

http://stackoverflow.com/questions/16414410/delete-empty-lines-using-sed


### dot command

Synonym of `source`. Runs commands from file in current shell.

`bash file` causes file to be run in child process, and parent script will not see modifications (e.g.: to variables).

http://askubuntu.com/questions/232932/in-a-bash-script-what-does-a-dot-followed-by-a-space-and-then-a-path-mean


### With or without `export`

`export` makes the variable available to sub-processes.

http://stackoverflow.com/questions/1158091/defining-a-variable-with-or-without-export


### Portable readarray

`readarray` is not available on OSX.

```
# instead of
readarray -t myArray < thing_per_line

# use
while read line; do
  myArray+=($line)
done < thing_per_line
```
http://stackoverflow.com/questions/23842261/alternative-to-readarray-because-it-does-not-work-on-mac-os-x


### Run command as another user

```
sudo -u pigmgr COMMAND
```
http://askubuntu.com/questions/294736/run-a-shell-script-as-another-user-that-has-no-password


### base64 decode

```
echo QWxhZGRpbjpvcGVuIHNlc2FtZQ== | base64 --decode
```
http://askubuntu.com/questions/178521/how-can-i-decode-a-base64-string-from-the-command-line


### Validate JSON

```
cat foo.json | python -m json.tool
# will print error if invalid, otherwise prints out json
```
http://stackoverflow.com/questions/3858671/unix-command-line-json-parser


### `xmllint`

Validate but don't output tree:
```
xmllint -noout foo.xml
```


### Time ANDed commands

```
time (sleep 1 && sleep 1)
```


### Check alias

Check what an alias is assigned to
```
type ALIAS
```
http://askubuntu.com/questions/102093/how-to-see-the-command-attached-to-a-bash-alias


### Run commands in parallel

```
pids=""
for command in $COMMANDS
do
  # Use & (ampersand) to run task in background
  # Use $! to get pid of most recent background command
  $command &
  pids+=" $!"
done

for pid in $pids
do
  wait $pid
done
```


### Read file line-by-line

```
filename="$1"
while read -r line
do
    echo "$line"
done < "$filename"
```
http://stackoverflow.com/questions/10929453/bash-scripting-read-file-line-by-line


### Iterate over files in directory

```
for test_file in tests/test_*.py
do
  ./$test_file
done
```
http://stackoverflow.com/questions/20796200/how-to-iterate-over-files-in-directory-with-bash


### `if` Expressions

http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html

```bash
# Tests the return status of the last executed command
# AND
if COMMAND1 && COMMAND2

# e.g.:
if ! grep foo my_file
then  # Run if "foo" not present in my_file
  ...
fi

# OR
if COMMAND1 || COMMAND2

[ -d FILE ] # true if FILE exists and is a directory
# Conditional expressions (include square brackets [ ] around them)
[ -f FILE ] # true if FILE exists and is regular file (not directory of link)
[ -e FILE ] # true if FILE exists. FILE could be directory.
[ -h FILE ] # true if FILE exists and is a symlink.
[ -n STRING ] or [ STRING ] # true if length of STRING is non-zero
[ -s FILE ] # true if FILE exists and has a size greater than 0
[ -x FILE ] # true if FILE exists and is executable
[ -z STRING ] # true if STRING is of length 0 (empty string)
              # can also be used to test if a variable is set
[ STRING1 == STRING2 ] # true if two strings are equal
[ STRING1 != STRING2 ] # true if two strings are not equal
[ $# < 1 ] # true if no arguments passed to script
[ ! EXPR ] # true if EXPR is false
```

Examples:

```
# integer comparison
# equal to
if [ "$a" -eq "$b" ]
# http://tldp.org/LDP/abs/html/comparison-ops.html

# check number of arguments
# https://stackoverflow.com/questions/18568706/check-number-of-arguments-passed-to-a-bash-script
if [ "$#" -ne 2 ]; then
  echo "Two arguments required."
  exit 1
fi

if [ -f /var/log/messages ]; then
  echo "/var/log/messages exists."
fi

# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_02.html
if [ $[$year % 400] -eq "0" ]; then
  echo "This is a leap year.  February has 29 days."
elif [ $[$year % 4] -eq 0 ]; then
        if [ $[$year % 100] -ne 0 ]; then
          echo "This is a leap year, February has 29 days."
        else
          echo "This is not a leap year.  February has 28 days."
        fi
else
  echo "This is not a leap year.  February has 28 days."
fi
```


### Truthiness: What is true? What is false?

`0` is true, `1` is false. See http://stackoverflow.com/questions/3924182/how-the-keyword-if-test-the-value-true-of-false. Exit codes of commands are evaluated. `0` is true, `1` is false.


### Comparison operators

```
-lt # less than
http://www.tldp.org/LDP/abs/html/comparison-ops.html
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

# check memory usage of process
ps aux PID

# VSZ = virtual memory usage of entire process (in KiB)
# RSS = resident set size, the non-swapped physical memory that a task has used (in KiB)
```
https://superuser.com/questions/117913/ps-aux-output-meaning


### Swap space

See http://www.linux.com/news/software/applications/8208-all-about-linux-swap-space.

Check `vm.swappiness` in `/etc/sysctl.conf`. Default is `60`. To verify:
```
sysctl vm.swappiness
```
A higher number means the system is more likely to swap pages out into swap space.


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


### Archiving/Unarchiving

Update one file in zip

```
# will update if file already exists
zip -r foo.zip path/to/file
```

https://stackoverflow.com/questions/4799553/how-to-update-one-file-in-a-zip-archive

Exclude files

```
zip -r $(BASE_NAME).zip $(BASE_NAME) -x foo/{*.class,*.swp}
```

https://gist.github.com/ldong/15ee0b1faa121891e9b53dddcefa0ca0

Zip ignore hidden files

```
zip -r bitvolution.zip bitvolution -x *.git*
```

https://askubuntu.com/questions/28476/how-do-i-zip-up-a-folder-but-exclude-the-git-subfolder


Zip hidden files

```
zip -r foo.zip .
```

http://stackoverflow.com/questions/12493206/zip-including-hidden-files

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


#### Delete longest match of `substring` from back of `string`

```
# string can be a variable name
${string%%substring}
```
http://tldp.org/LDP/abs/html/string-manipulation.html


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

```
# Remove longest match of `substring` from `$string`
${string##substring}
```

Also see http://wiki.bash-hackers.org/syntax/pe#substring_removal.

Remove last character from substring:

```bash
${MYSTRING%?}
```

`%` (percent) matches from the end. `?` matches any character. See http://wiki.bash-hackers.org/syntax/pattern.


### Bash dollar sign variables

See http://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables.

```
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

### Bash Bang commands and related stuff

See http://ss64.com/bash/bang.html. On Linux, `Alt + .` prints out the last word of the last command.

```
!! # run last command again
!foo # run most recent command starting with foo
!foo:p # !foo dry run, adds !foo to command history
!$ # last parameter/last argument of the last command
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

### `xargs`

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


### SCP with proxy

```
scp -oProxyCommand="ssh -W %h:%p proxyhost.example.com" myFile destinationhost.example.com:
```

https://superuser.com/questions/276533/scp-files-via-intermediate-host


### scp multiple files in one command

```
scp FILE1 FILE2 DESTINATION
scp lib/{j1.jar,j2.jar,j3.jar} .
```

### Recursively diff directories

```
diff -r dir1 dir2
```

https://unix.stackexchange.com/questions/49496/recursively-compare-two-directories-with-diff-r-without-output-on-broken-links


### Diff and ignore whitespace

```
diff -w FILE1 FILE2
```

### Diff file names between two directories

```
diff <(ls -1a ./dir1) <(ls -1a ./dir2)
```

http://superuser.com/questions/228763/how-to-diff-file-names-in-two-directories-without-writing-to-intermediate-files


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

### Apply patch as is

```
patch -p0 < patch.diff
```


### Apply part of a patch (changes to only one file)

```
patch FILE PATCH
```

### Apply patch in reverse

```
patch -R < PATCH
```

### Extract diffs concerning specific files from a diff

```
filterdiff -i '*file' patch.diff > filtered.diff
```

One issue with `filterdiff -i` is it removes any `diff --git ...` and `index ...` lines. To avoid this, you can use `filterdiff -x` or `filterdiff -X`. However, it does not exclude new and deleted files:
```
filterdiff -X fileWithExcludePatternsOnePerLine patch.diff > filtered.diff
```

### Change file/directory modified or inode change time

```
# mtime
touch -m --date="7 days ago" FILE
```


### atime vs ctime vs mtime

```
ls -l   # mtime (modification time)
ls -cl  # ctime (inode change time)
ls -ul  # atime (access time)
```


### List folders only

```
ls -d */
```

https://stackoverflow.com/questions/14352290/listing-only-directories-using-ls-in-bash-an-examination


### `ls` another user's home directory

```
ls ~USER
```


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


### List files sorted by size

```
ls -Ssh
```

http://superuser.com/questions/368784/how-can-i-sort-all-files-by-size-in-a-directory


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
```

http://stackoverflow.com/questions/4210042/exclude-directory-from-find-command


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


### du of every file/directory (including hidden ones) in current directory, sort from smallest to largest:

See http://askubuntu.com/questions/356902/why-doesnt-this-show-the-hidden-files-folders.

```
# du hidden files
du -sh  .[!.]* * | sort -h
```


### Convert epoch time (seconds) to date

```
# Linux
date -d @1432752946.852

# Mac
date -jf %s 1446662585
```

http://stackoverflow.com/questions/21958851/convert-unix-epoch-time-to-human-readable-date-on-mac-osx-bsd


### Date in `yyyyMMdd` format

```
date +%Y%m%d
```


### Date in epoch

```
# Linux
date +%s

# Mac
date -j -f "%Y%m%d %T" "20170808 00:00:00" +%s
```


### Date one day ago (only works on Linux)

```
date --date="1 day ago" +%Y%m%d
```

### Seconds since epoch:

```
# Mac
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


### Store stderr in variable

```
VAR=$((your-command-including-redirect) 2>&1)
```

https://stackoverflow.com/questions/3130375/bash-script-store-stderr-in-a-variable


### Redirect both stdout and stderr to the same file

See http://www.gnu.org/software/bash/manual/bashref.html#Redirecting-Standard-Output-and-Standard-Error.

```
<command> &> file
```

https://askubuntu.com/questions/625224/how-to-redirect-stderr-to-a-file


### Look up hostname/IP address associated with IP address/hostname

```
nslookup <ip_address>
nslookup <hostname>
```


### URL encode string

```
# $1 is the first argument to the script
value="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$1")"
echo $value
```

https://stackoverflow.com/questions/296536/how-to-urlencode-data-for-curl-command


### `echo` string with escape characters

`$''` causes escape sequences to be interpreted.
```
echo $'a\tb'
```


### Print current machine name

```
hostname
```


### Find all file descriptors used by a process

```
ls -l /proc/PROCESS_ID/fd | less
```


### Check system specs (CPU, memory, etc.)

```
cat /proc/cpuinfo
cat /proc/meminfo
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


### Copy files while excluding certain files

```
rsync -avr --exclude='path1/to/exclude' --exclude='path2/to/exclude' source/ destination
```

`source/` (with trailing slash) means copy contents of `source` into `destination`. `source` means copy `source` folder itself into `destination`.

https://askubuntu.com/questions/333640/cp-command-to-exclude-certain-files-from-being-copied


### `rsync` example:

```
# copy and show progress
rsync --progress SOURCE DEST

rsync -az
```

`-a` means "archive" mode, which preserves symbolic links, permissions, etc. `-z` enables compression for the data transfer.


### If command failed, do something

```
if ! command ; then ... ; fi
```

https://unix.stackexchange.com/questions/22726/how-to-conditionally-do-something-if-a-command-succeeded-or-failed


### Run command only if previous command succeeded (exit status of 0) or failed

See http://stackoverflow.com/questions/7402587/run-command2-only-if-command1-succeeded-in-cmd-windows-shell.

```
command1 && command2
command1 || command2
```


### `set`: Treat unset variables as error and exit immediately

```
set -u
```

https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/


### Set exit status of pipeline to rightmost command to exit with non-zero status

```
set -o pipefail
```

https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/


### Exit immediately if any command returns non-0

```
set -e
```

http://stackoverflow.com/questions/19622198/what-does-set-e-in-a-bash-script-mean


### Print out commands run

```
set -x
```

http://serverfault.com/questions/391255/what-does-passing-the-xe-parameters-to-bin-bash-do


### Start reading from middle of large file

```
# Skip first 3 GB
tail -c +3221225472 FILE | less
```

http://unix.stackexchange.com/questions/8444/is-it-possible-in-bash-to-start-reading-a-file-from-an-arbitary-byte-count-offs


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

# host:current_directory user$
export PS1="\h:\W \u$ "
```

https://superuser.com/questions/60555/show-only-current-directory-name-not-full-path-on-bash-prompt


### See quota for a user

```
quota -s ahsu

# If command prints nothing, no quota set.
# https://askubuntu.com/questions/703323/why-would-the-quota-command-not-work-at-all?newreg=577748f150494a27a66b070d7d421831
```

For an explanation of the output, see http://serverfault.com/questions/94368/understanding-quota-output

To calculate the amount of space used, multiply the number of blocks (first number) by the BLOCK_SIZE (defined in /usr/include/sys/mount.h). Reference: http://stackoverflow.com/questions/2506288/detect-block-size-for-quota-in-linux


### See keyboard shortcut bindings

```
bind -P
```


### Delete previous word

```
# on Mac
Esc + Backspace
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


### Configure PATH

```
# Option 1
$HOME/.bash_profile

# Option 2
/etc/paths.d

# System defaults are in `/etc/paths`
```

http://www.cyberciti.biz/faq/appleosx-bash-unix-change-set-path-environment-variable/


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

# Exclude some directories
tree -I build
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


### Count instances of character in string

```
# -o only prints matching portions, one per line
getent netgroup my_custom_netgroup | grep -o '(' | wc -l
```

https://stackoverflow.com/questions/16679369/count-occurrences-of-a-char-in-a-string-using-bash


### `cut` on whitespace

```
tr -s ' ' | cut -d ' ' -f 4
```
`-s` means `--squeeze-repeats`, which means to replace repeated instances of the character with a single instance.

### Trim whitespace

```
cat FILE | tr -d '[[:space:]]'
```
http://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable


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


### Print last column

```
# $NF is number of fields
hadoop fs -ls /input/part* | awk '{printf "%s ", $NF}'
```


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


### Delete lines in files

```
# Mac
sed -i '' '/pattern/d' ./infile
sed -i '' '/pattern/d' ./*.conf
```

https://stackoverflow.com/questions/5410757/delete-lines-in-a-text-file-that-contain-a-specific-string


### Find and replace

```
# Portable
find . -name pom.xml -exec perl -pi -w -e 's/foo/bar/g' {} \;

find /path/to/files -type f -exec sed -i 's/oldstring/new string/g' {} \;
```

http://stackoverflow.com/questions/15402770/how-to-grep-and-replace


### Replace string in all files

```
# Linux
sed -i 's/old-word/new-word/g' *.txt

sed -i 's/%{foo}/\/export\/apps\/foo/g' my_file

# Mac
# http://stackoverflow.com/questions/4247068/sed-command-with-i-option-failing-on-mac-but-works-on-linux
sed -i '' 's/old-word/new-word/g' *.txt

# portable
perl -pi -w -e 's/ahsu/dalitest/g' *.job
# -p means to assume following loop around your program
              LINE:
                while (<>) {
                    ...             # your program goes here
                } continue {
                    print or die "-p destination: $!\n";
                }
# -i means files processed by '<>' construct are to be edited in-place
# -w prints warnings about dubious constructs
# -e used to enter a one-line program


### lowercase line

perl -pi -w -e 's/(^LINE_TO_LOWERCASE$)/lc($1)/ge'
# /e tells Perl to evaluate replacement as Perl expression first
```

* http://www.cyberciti.biz/faq/unix-linux-replace-string-words-in-many-files/
* http://lifehacker.com/5810026/quickly-find-and-replace-text-across-multiple-documents-via-the-command-line


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


### Auto enter input in command line

```
yes | ./script
```
http://askubuntu.com/questions/338857/automatically-enter-input-in-command-line


### Delete files older than 1 day

```
# Test
find ./my_dir -mtime +1

# Delete
find ./my_dir -mtime +1 -delete
```
http://stackoverflow.com/questions/13489398/delete-files-older-than-10-days-using-shell-script-in-unix


### Delete /tmp folders belonging to a user

```
ls -l /tmp | grep $USER | tr -s ' ' | cut -d ' ' -f 9 | xargs -I% rm -rf /tmp/%
```


### Copy file multiple times

```
for i in {a,b,c,d}; do cp HW3-Exp-1a.qry HW3-Exp-3${i}.qry; done
```

https://unix.stackexchange.com/questions/291065/duplicate-file-x-times-in-command-shell
https://www.cyberciti.biz/faq/bash-for-loop-array/


### Copy directory while resolving symlinks

```
cp -Lr FROM TO
```

http://superuser.com/questions/216919/how-to-copy-symlinks-to-target-as-normal-folders


### Single quote literals inside single-quoted string

Mix and match single and double-quoted strings.

```
'foo'"'"'bar'  # foo'bar
```

https://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings


### Double Quotes

* Preserve literal value of all characters except `$`, `\``, `\\`, and `!` (when history expansion is enabled).
* http://www.gnu.org/software/bash/manual/html_node/Double-Quotes.html


### Extract substring in Bash

http://stackoverflow.com/questions/13373249/extract-substring-using-regexp-in-plain-bash

```
echo "US/Central - 10:26 PM (CST)" | grep -oP "\-\s+\K\d{2}:\d{2}"

$ echo "US/Central - 10:26 PM (CST)" |
    perl -lne 'print $& if /\-\s+\K\d{2}:\d{2}/'
```


### Update symlink

```
# Mac
ln -hfs NEW_LOCATION EXISTING_LINK
# https://superuser.com/questions/36626/how-to-change-a-symlink-in-os-x/938865#938865

# Linux
ln -fns NEW_LOCATION EXISTING_LINK
# http://serverfault.com/questions/389997/how-to-override-update-a-symlink
```


### Length of array

```
${#array[@]}
```

http://unix.stackexchange.com/questions/193039/how-to-count-the-length-of-an-array-defined-in-bash


### Check filesystem type

```
# Linux
df -T

mount
```

http://unix.stackexchange.com/questions/53313/how-to-show-the-filesystem-type-via-the-terminal


### For loop

```
for i in {1..5}
do
   echo "Welcome $i times"
done

# http://www.cyberciti.biz/faq/bash-for-loop/
```

### Loop over all files in directory

```
for f in *; do echo $f; done

# read all files in directory into comma-separated string
a=""; for f in *.q; do a+=$f; done; echo $a
```
http://www.cyberciti.biz/faq/bash-loop-over-file/


### Split string

```
# into multiple lines
echo $FOO | tr '<delimiter>' '\n'

# Example
getent netgroup NETGROUP_NAME | tr ')' '\n' | wc -l


# On whitespace
sentence="this is a story"
stringarray=($sentence)
echo ${stringarray[0]}
first_word=${stringarray[0]}
# http://stackoverflow.com/a/13402368/1128392

# Split on /
IFS='/' read -ra PARTS <<< "$A"
GROUP="${PARTS[5]}.${PARTS[6]}.${PARTS[7]}"
MODULE="${PARTS[8]}"
VERSION="${PARTS[9]}"
ARTIFACT="$GROUP:$MODULE:$VERSION"
echo $ARTIFACT
```

http://stackoverflow.com/questions/673055/correct-bash-and-shell-script-variable-capitalization


### Multiline String

```
s=$(cat << EOF
multi
  line
string
EOF
)

echo "$s"
```

http://stevemorin.blogspot.com/2011/01/multi-line-string-in-bash.html