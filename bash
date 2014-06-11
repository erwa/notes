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