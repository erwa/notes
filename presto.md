### Lateral View
Use `CROSS JOIN UNNEST` instead of `LATERAL VIEW explode()`.

```
-- Hive
SELECT student, score
FROM tests
LATERAL VIEW explode(scores) t AS score;

-- Presto
SELECT student, score
FROM tests
CROSS JOIN UNNEST(scores) AS t (score);
```

https://prestodb.io/docs/current/migration/from-hive.html


### Basic queries
```
desc schema.table

show tables in my_schema
```


### Show all databases
```
show schemas
```

### Catalogs
Presto supports connectors to other storage systems to allow it to query data stored in these systems. These systems will show up as "catalogs" in presto.

```
show catalogs
```