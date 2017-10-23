### Hybrid table, union type

```
create table temp (a uniontype<boolean, string>) partitioned by (b int) stored as orc;

insert into temp partition (b=1) select create_union(1, true, word) from words;

alter table temp set fileformat avro;

select * from temp;
```


### Create partitioned table

```
create table part_test (a string) partitioned by (b int);
```


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