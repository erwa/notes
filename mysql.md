-- UPDATE rows in table
update db.table set col=... where col=...;

-- MySQL
-- See permissions for user
SHOW GRANTS;

-- Connect to host, database using certain username and password
mysql -h <host> -D <database> -u <username> -p
Enter password:

-- Run a file from the MySQL shell
source <file>;

# Configure MySQL in /etc/my.cnf
user=mysql

# Start MySQL
sudo mysqld
# on a specific port
sudo mysqld --port=3307

# Shutdown MySQL
sudo mysqladmin shutdown

# Connect through an SSH proxy
# http://stackoverflow.com/questions/18373366/mysql-connection-over-ssh-tunnel-how-to-specify-other-mysql-server
ssh -f user@ssh.example.com -L 3307:mysql1.example.com:3306 -N
mysql -h 127.0.0.1 -P 3307
