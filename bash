# if statements, expressions like [ -f FILE ]
# http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html

# See current memory usage
free
top

# Swap space
# www.linux.com/news/software/applications/8208-all-about-linux-swap-space
# Check vm.swappiness in /etc/sysctl.conf
# Default is 60
# To verify:
sysctl vm.swappiness
# Higher # means system is more likely to swap pages out into swap space

# grep only files matching a pattern
grep --include=*.job -r "type=hive" ./*

# grep for items that do NOT match a pattern
grep -v <pattern>

# grep starting from certain line number
sed -n '<line_number>,$ p' <file> | grep <pattern>

# See members of a group
getent group <groupname>

# zip/unzip folder
zip -r foo.zip foo
unzip foo.zip

# list files in a zip
unzip -l foo.zip

# show files in tar/tarball/tar.bz2
tar -tvf file.tar
tar -ztvf file.tar.gz
tar -jtvf file.tar.bz2

# Extract to different directory
tar -xf archive.tar --directory=/target/directory

# tar while excluding directories
tar cvzf file.tar.gz  --exclude 'dir/a/*' --exclude 'dir/b/*' dir

# cd to previous directory
cd -

# Substring removal
# http://wiki.bash-hackers.org/syntax/pe#substring_removal

# Remove last character from substring_removal
${MYSTRING%?}
# % (percent) matches from the end
# ? matches any character
# http://wiki.bash-hackers.org/syntax/pattern

# schedule a cron job
crontab -e
# http://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/
# crontab stored in /var/spool/cron/, but not meant to be edited by hand
# http://askubuntu.com/questions/216692/where-is-the-user-crontab-stored

# To see recent cron job runs
grep <script_name> /var/log/cron

# Bash dollar sign variables
# http://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables
$1, $2, $3 # positional parameters
$@ array representation of positional parameters
$# # number of parameters
$* # IFS (Internal Field Separator) expansion
$- # current shell options
$$ # pid of current shell
$_ # most recent parameter
$IFS # input field separator
$? # most recent foreground exit status
$! # PID of most recent background command
$0 # name of shell or shell script

# Bash Bang (!) commands
# http://ss64.com/bash/bang.html
Alt + . # prints out last word of last command
!! # run last command again
!foo # run most recent command starting with foo
!foo:p # !foo dry run, adds !foo to command history
!$ # last parameter of the last command
^foo^bar # run last command replacing foo with bar

# Add to .bashrc to enable color ls output by default
alias ls="ls --color=auto"

# Set/modify/remove/see user-specific ACLs
setfacl -m user:<user>:rwx <file>
setfacl -x <user> <file> # Remove <user> from <file>'s ACL list
setfacl --remove-all <file> # Remove all ACLs for a file
setfacl --remove-default <file> # Remove default ACLs
getfacl <file>

# User needs execute permissions on a directory to cd into it.
# Even if a file is 777, a user still needs permissions on the chain of
# parent directories to access the file.

# xargs with string substitution
cat temp | xargs -I 'TABLE' hive -e 'drop table TABLE'

# Apply a patch, but strip off leading a/ and b/
# Example: Diff patch.diff looks like
diff --git a/file b/file
...
# To apply as if the diff looks like
diff --git file file
...
# use
patch -p1 < patch.diff

# Extract diffs only applying to one file from another diff
filterdiff -i '*file' patch.diff > filtered.diff

# One issue with filterdiff -i is it removes any "diff --git ..." and "index ..." lines
# To avoid this, you can use filterdiff -x or -X. However, it does not exclude new and deleted files.
filterdiff -X fileWithExcludePatternsOnePerLine patch.diff > filtered.diff

# ls everything on one line
ls | tr "\\n" " "

# ls: output one file per line
ls | cat

# Check disk usage, output in human-readable format
df -h

# Check disk usage of a directory, output in human-readable format
du -h DIR