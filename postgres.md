# Postgres notes

### Tuples only

`\t` or `\pset tuples_only` or use `psql -t`

https://www.postgresql.org/docs/current/app-psql.html

### Logical replication slot spilled bytes

https://www.postgresql.org/docs/14/monitoring-stats.html#MONITORING-PG-STAT-REPLICATION-SLOTS-VIEW

Can monitor the `spill_bytes` field of `pg_stat_replication_slots` to measure the rate of spilling to disk.

### Sum size of all relations in database

```
SELECT
       sum(c.reltuples) AS row_estimate,
      pg_size_pretty(sum(pg_total_relation_size(c.oid))) AS total_bytes,
      pg_size_pretty(sum(pg_indexes_size(c.oid))) AS index_bytes,
      pg_size_pretty(sum(pg_total_relation_size(reltoastrelid))) AS toast_bytes
    FROM
      pg_class c
      LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE relkind = 'r'
;
```

### Check available space in table

```
select avail as available_space, count(*) as number_of_blocks
from pg_freespace('pg_toast.pg_toast_9828')
group by avail order by avail;
```

### Find blocked processes and which process is blocking them

```
select pid,
       usename,
       pg_blocking_pids(pid) as blocked_by,
       query as blocked_query
from pg_stat_activity
where cardinality(pg_blocking_pids(pid)) > 0;
```

https://stackoverflow.com/questions/26489244/how-to-detect-query-which-holds-the-lock-in-postgres


### kill all Postgres processes

```
ps -ef | grep postgres | tr -s ' ' | cut -d ' '  -f 2 | xargs -I% sudo kill -9 %
```


### Record size limit

No maximum. You can create an arbitrarily large record by, for example, creating a lot of tables inside one transaction - the COMMIT record will be very big.

```
DO $$
DECLARE
  table_name CHAR(32);
BEGIN
  FOR i IN 1..4000 LOOP
        table_name := 'table_' || i;
        EXECUTE format('CREATE TABLE %s (a INT)', table_name);
  END LOOP;
END;
$$;
```


### One record per page

```
CREATE TABLE t1(col1 bigint, col2 char(4096)[] default '{"1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"}') with (fillfactor = 10, autovacuum_enabled=false);
```


### Get my process id (pid)

```
SELECT pg_backend_pid();
```


### Find blocks in buffer cache from relation

```
CREATE EXTENSION pg_buffercache;

SELECT COUNT(*) FROM pg_buffercache WHERE relfilenode='t1'::regclass AND relforknumber=0 AND relblocknumber=0;
```


### Get database name from OID

```
select oid, datname from pg_database where oid=18091;
```


### Get relation name from OID

```
select oid,relname from pg_class where oid=16421;
  oid  | relname
-------+---------
 16421 | test
```

https://postgrespro.com/list/thread-id/1348909


### Get relation OID

`SELECT 'mytbl'::regclass::oid;`

https://stackoverflow.com/questions/10953123/how-to-determine-the-oid-of-a-postgres-table


### Convert pg_lsn to bigint

```
SELECT lsn - '0/0';
```

https://stackoverflow.com/questions/66797767/lsn-external-representation


### Look at raw WAL bytes

```
$ hexdump -s 0x1FF0 -n 100 000000010000003E00000002
0001ff0 1004 a280 f080 04cf 8010 80a2 cff0 1004
...
```


### Find WAL file containing LSN

```
select pg_walfile_name('76/7D000028');
```

https://www.crunchydata.com/blog/postgres-wal-files-and-sequuence-numbers


### Current WAL flush LSN

`SELECT pg_current_wal_flush_lsn();`

https://www.postgresql.org/docs/14/functions-admin.html#FUNCTIONS-ADMIN-BACKUP


### Different types of indexes

E.g.: hash, btree, gist, gin, etc. Explained in links at bottom of https://www.interdb.jp/pg/pgsql01.html


### Vacuum

One of the things it helps with is solving the transaction id wraparound issue.

https://www.postgresql.org/docs/9.4/routine-vacuuming.html#VACUUM-FOR-WRAPAROUND


### Epoch to timestamp

```
SELECT *, to_timestamp(time_in_milli_sec / 1000) FROM mytable;
```

https://stackoverflow.com/questions/7872720/convert-date-from-long-time-postgres


### Search path

Set schemas to search:

```
set search_path to myschema,public;
```

https://www.postgresql.org/docs/9.1/ddl-schemas.html


### Double colon

Used to cast to a type

```
% a.dc is cast to a date
b.date_completed >  a.dc::date + INTERVAL '1 DAY 7:20:00'
```

https://stackoverflow.com/questions/5758499/double-colon-notation-in-sql


### Alter table example / alter column example

```
alter table test_conversion alter column my_field type varchar;

ALTER TABLE products ALTER COLUMN price SET DEFAULT 7.77;

ALTER TABLE IF EXISTS mytable ADD COLUMN IF NOT EXISTS mycolumn VARCHAR NOT NULL DEFAULT '';
```

https://www.postgresql.org/docs/9.5/ddl-alter.html


### CREATE TABLE

```
CREATE TABLE IF NOT EXISTS test (
    f       jsonb   NOT NULL default '{}'::jsonb
);
```


### JSON operators

```
% -> returns object, ->> returns text

SELECT info -> 'items' ->> 'product' as product
FROM orders
ORDER BY product;

SELECT info ->> 'customer' AS customer
FROM orders
WHERE info -> 'items' ->> 'product' = 'Diaper';

delete from foo where field->>‘type’ = ‘v2’;
```

https://www.postgresql.org/docs/9.3/functions-json.html


### Insert example

```
insert into test_conversion values ('"test json string"');
insert into test values ('"test json string"');
```


### String match on jsonb field

```
select * from test where f::text like '%json%';
```

https://dba.stackexchange.com/questions/179598/how-can-i-use-a-full-text-search-on-a-jsonb-column-with-postgres


### String with single quotes

Single quote literal = two quotes.

```
select * from puzzles_puzzle where name = 'Who''s Who';
```

https://stackoverflow.com/questions/12316953/insert-text-with-single-quotes-in-postgresql


### Run Postgres locally

```
sudo --user=postgres /usr/lib/postgresql/14/bin/initdb /tmp/data
sudo --user=postgres /usr/lib/postgresql/14/bin/pg_ctl -D /tmp/data -l /tmp/logfile start
sudo --user=postgres /usr/lib/postgresql/14/bin/pg_ctl -D /tmp/data -l /tmp/logfile stop

# connect
psql -U postgres
```

https://www.postgresql.org/docs/14/server-start.html


### Run script

```
\i foo.sql

psql -f thefile.sql targetdatabase
```

https://superuser.com/questions/701415/how-do-i-execute-run-a-sql-file-in-postgresql-9-2-6-centos


### Check Postgres version

```
select version();
```

https://stackoverflow.com/questions/13733719/which-version-of-postgresql-am-i-running


### Output to file

```
# tab-separated by default
\copy (Select * From foo) To '/tmp/test.csv'
\copy (Select * From foo) To '/tmp/test.csv' With CSV
```

https://stackoverflow.com/questions/1517635/save-pl-pgsql-output-from-postgresql-to-a-csv-file


### Scroll up in long output

```
# use pager that can scroll up
export PAGER=less
psql ...
```

https://stackoverflow.com/questions/48938202/postgresql-how-to-scroll-up-in-long-output


### Disable output paging / turn off "less" output

```
\pset pager off
```

https://stackoverflow.com/questions/11180179/postgresql-disable-more-output


### DROP DATABASE

```
DROP DATABASE [IF EXISTS] name;
```

http://www.postgresqltutorial.com/postgresql-drop-database/


### Drop all tables from database

Use this to generate the SQL

```
select 'drop table if exists "' || tablename || '" cascade;' from pg_tables where schemaname = 'public';

select  'drop table if exists "' || tablename || '" cascade;' from pg_tables where tableowner = 'testuser';
```

https://stackoverflow.com/questions/3327312/how-can-i-drop-all-the-tables-in-a-postgresql-database


### See current user

`SELECT current_user;`


### Create database with user and password

```
sudo -u postgres psql

CREATE DATABASE mydb;
create user myuser with encrypted password 'mypass';
grant all privileges on database mydb to myuser;
```

https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e


### Show configuration

```
show <config>;
show all;  --show all configs
```


### Number of databases

```
select count(*) from pg_catalog.pg_database;
```


### Show databases / show functions / show tables / show schemas / show roles / show user privileges / use database / describe table

```
\df  # show all functions
# show functions in some schema
\df <schema>.*

# show schemas (which are like folders to group tables, views, and functions)
\dn

\l  # show databases and privileges

\dt  # show tables (once inside database)
\dt <schema>.*  # show tables in one schema
\dt my_schema.  # show tables in schema 'my_schema'
                # the trailing "." is important!

\du  # show user privileges

# use database DB_NAME;
\c <DB_NAME>;

# describe table
\d <TABLE>;
```

https://dba.stackexchange.com/questions/4286/list-the-database-privileges-using-psql
https://stackoverflow.com/questions/769683/show-tables-in-postgresql


### List foreign tables

```
\det
```


### Describe a table

```
\d table_name
\d schema_name.table_name
```


### See view definition

```
\d+ view_name
```


### Python UDFs

```
create extension plpythonu;

-- create pytest function
create function pytest(a integer) returns varchar(255) as $$
  return "pytest_function " + str(a)
$$ language plpythonu;

-- drop pytest function
drop function pytest(integer);

-- use pytest
select pytest(a) from test;
```


### Enable timing

```
\timing on

-- to toggle on/off
\timing
```

https://stackoverflow.com/questions/9063402/get-execution-time-of-postgresql-query
