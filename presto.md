### `count_if`
```
count_if(is_hive)
```
https://prestodb.io/docs/current/functions/aggregate.html#count_if


### Convert epoch to timestamp
```
from_unixtime(epoch_time_in_seconds)
```
https://prestodb.io/docs/current/functions/datetime.html#from_unixtime


### Not equal
`<>`
https://prestodb.io/docs/current/functions/comparison.html


### Support for Variables

Not yet.

http://stackoverflow.com/questions/34301577/does-presto-have-the-equivalent-of-hives-set-command
https://github.com/prestodb/presto/issues/5918


### URL encode
```
url_encode(string)
```

https://prestodb.io/docs/current/functions/url.html#url_encode


### Round
```
round(x, d)  // round x to d decimal places
```
https://prestodb.io/docs/current/functions/math.html


### Floating point division of integers
```
SELECT CAST(5 AS DOUBLE) / 2
```
https://prestodb.io/docs/current/migration/from-hive.html#use-cast-when-dividing-integers


### IN clause
```
SELECT name
FROM nation
WHERE regionkey IN (SELECT regionkey FROM region)  // cannot reference CTE
```
https://prestodb.io/docs/current/sql/select.html#in


### Common Table Expressions
```
WITH subtable1 AS (
  SELECT ...
),
subtable2 AS (
  SELECT ... // can refer to subtable1 here
)
SELECT ...
```


### CASE WHEN
```
CASE expression
    WHEN value THEN result
    [ WHEN ... ]
    [ ELSE result ]
END
```
https://prestodb.io/docs/current/functions/conditional.html


### Regular Expression capture group
```
SELECT regexp_extract('1a 2b 14m', '(\d+)([a-z]+)', 2); -- 'a'
```
https://prestodb.io/docs/current/functions/regexp.html#regexp_extract


### String contains
```
string_field like '%pattern%'

# can also use regexp_like (which only requires that pattern is contained in string instead of matching the whole string)
```
https://prestodb.io/docs/current/functions/regexp.html


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