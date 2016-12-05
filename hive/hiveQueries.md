### Add partition
```
ALTER TABLE table_name ADD PARTITION (dt='2008-08-08') LOCATION '/tmp/foo';
```


### Drop multiple tables
```
hive -e "use my_database; show tables 'temp*'" | xargs -I '{}' hive -e 'use my_database; drop table {}'
```
http://stackoverflow.com/questions/35888972/dropping-multiple-tables-with-same-prefix-in-hive


### Rename partition
```
ALTER TABLE table_name PARTITION partition_spec RENAME TO PARTITION partition_spec;
```