### Add column
```
alter table avro_int_string3 add columns (b string);
```


### Alter column

```
use my_db;
alter table foo change bar qux string;
```


### Examples

```
# Hive print column names
set hive.cli.print.header=true;

# hive show permissions/roles/grants for user
show grant user ahsu on database u_ahsu;
show role grant user ahsu;

# Hive example join
select * from test2 a join test3 b where a.id = b.k;

# load local data into Hive table
# path specified is a directory
load data local inpath '/export/home/ahsu/test2' into table test2;
```

### create Hive table
```
-- create text Hive table
create table test (a string) row format delimited fields terminated by ',' stored as textfile;
```

### Disable map joins
Map joins require launching a local task, which might cause memory issues
```
set hive.auto.convert.join = false;
```

### Enable session history
```
hive -hiveconf hive.session.history.enabled=true
# Default is false.
# If true, this will cause a log to be created in `hive.querylog.location`
```

### Unset table properties
```
ALTER VIEW view UNSET TBLPROPERTIES IF EXISTS ('foo', 'bar');

alter table test unset tblproperties if exists ('foo');
```
https://issues.apache.org/jira/browse/HIVE-3829