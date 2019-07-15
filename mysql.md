### mysqldump

```
mysqldump -u root -p --no-data --single-transaction --quick database_name > schema.sql
```


### Drop all tables

To generate the commands.

```
SELECT concat('DROP TABLE IF EXISTS `', table_name, '`;')
FROM information_schema.tables
WHERE table_schema = 'MyDatabaseName';
```

Disable integrity checks before running:

```
SET FOREIGN_KEY_CHECKS = 0;
```

After running, re-enable integrity checks:

```
SET FOREIGN_KEY_CHECKS = 1;
```

https://stackoverflow.com/questions/3476765/mysql-drop-all-tables-ignoring-foreign-keys


### See foreign key relationships

```
select * from information_schema.table_constraints;
```

https://stackoverflow.com/questions/7765820/query-to-find-foreign-keys


### Size of tables

```
-- Returns tables sorted from largest to smallest
SELECT
     table_schema as `Database`,
     table_name AS `Table`,
     round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB`
FROM information_schema.TABLES
ORDER BY (data_length + index_length) DESC;
```

https://stackoverflow.com/questions/9620198/how-to-get-the-sizes-of-the-tables-of-a-mysql-database


### mysqlsh

```
# switch to SQL mode
\sql
```

https://dev.mysql.com/doc/mysql-shell/8.0/en/mysqlsh.html


### Drop rows

```
DELETE FROM t WHERE foo = 123;
```


### JSON parsing libraries

https://dev.mysql.com/doc/refman/5.7/en/json-function-reference.html


### When locks are released

https://dev.mysql.com/doc/refman/5.7/en/lock-tables.html (see "Rules for Lock Release")


### Kill long-running transactions

Set `wait_timeout`. See http://stackoverflow.com/questions/9936699/mysql-rollback-on-transaction-with-lost-disconnected-connection

Long-running query doesn't count as idle. Can test using something like: `select 1, sleep(10) from dual`


### Implicit Commits

Some statements cause implicit commits. For example, most DDL commands.

https://dev.mysql.com/doc/refman/5.7/en/implicit-commit.html


### Primary, Unique, and Multiple Occurrences Keys

* Primary key can only appear once per table

http://stackoverflow.com/questions/5317889/sql-keys-mul-vs-pri-vs-uni


### Show default transaction isolation level

```
mysql> SHOW GLOBAL VARIABLES LIKE 'tx_isolation';
+---------------+-----------------+
| Variable_name | Value           |
+---------------+-----------------+
| tx_isolation  | REPEATABLE-READ |
+---------------+-----------------+
1 row in set (0.00 sec)
```

http://stackoverflow.com/questions/5347567/view-isolation-level-for-a-query-in-mysql

Default isolation level for InnoDB (MySQL's default storage engine) is REPEATABLE READ.


### NULL predicate

Use `IS NULL`. `= NULL` does NOT work.


### LIKE expression

```
select * from foo where name like 'bar%' limit 5;
```


### UPDATE rows in table

```
update db.table set col=... where col=...;
```


### See permissions for user

```
SHOW GRANTS;
```


### Connect to host, database using certain username and password

```
mysql -h <host> -D <database> -u <username> -p
Enter password:
```


### Run a file from the MySQL shell

```
source <file>;
```


### Configure MySQL in /etc/my.cnf

```
user=mysql
```

### Start MySQL

```
# You can also run without root access, but you still need root to shutdown using `sudo mysqladmin shutdown`
sudo mysqld
# on a specific port (default is 3306)
sudo mysqld --port=3307
```

### Shutdown MySQL

```
sudo mysqladmin shutdown
```


### Connect through an SSH proxy

```
# http://stackoverflow.com/questions/18373366/mysql-connection-over-ssh-tunnel-how-to-specify-other-mysql-server

# ssh.example.com is host that is allowed to access MySQL host
# mysql1.example.com is the MySQL host you're trying to access
ssh -f user@ssh.example.com -L 3307:mysql1.example.com:3306 -N
mysql -h 127.0.0.1 -P 3307
```