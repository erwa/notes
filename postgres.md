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


### Show databases / show tables / show roles / use database / describe table

```
\l  # show databases and privileges

\dt  # show tables (once inside database)

\du

# use database DB_NAME;
\c <DB_NAME>;

# describe table
\d <TABLE>;
```

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
\timing
```
