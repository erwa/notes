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

# Find jar that a class is in
# http://stackoverflow.com/questions/275120/java-how-do-i-know-which-jar-file-to-use-given-a-class-name
for f in `find . -name '*.jar'`;  do echo $f && jar tvf $f | grep -i CLASSNAME; done

# grep only files matching a pattern
grep --include=*.job -r "type=hive" ./*

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

# extract one file from a jar
# specify full path to file inside jar
jar xf JAR FILE

# delete a file from a jar
zip -d JAR FILE

# add file to jar
# update a file in a jar
# you have to recreate the file structure outside the jar first
jar uf JAR FILE

# create a jar
jar cf JAR_NAME.jar file1 file2 dir1 file3 dir2 ...

# Decompile Java class
javap -c -private AvroGenericRecordReader

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
