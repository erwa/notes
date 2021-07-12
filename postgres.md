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
