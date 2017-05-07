### DISTINCT
Removes duplicates from result set (takes all columns into consideration). Think of "SELECT DISTINCT" as a unit.

https://blog.udemy.com/sql-select-distinct/
http://stackoverflow.com/questions/54418/how-do-i-or-can-i-select-distinct-on-multiple-columns


### COUNT DISTINCT with conditions
```
select
  count(distinct tag) as tag_count,
  count(distinct (case when entryId > 0 then tag end)) as positive_tag_count
from
  your_table_name;
```
http://stackoverflow.com/questions/14048098/count-distinct-with-conditions


### Alias in GROUP BY clause
Reason you often can't use alias is because SQL usually executed in this order:

```
FROM clause
WHERE clause
GROUP BY clause
HAVING clause
SELECT clause
ORDER BY clause
```

http://stackoverflow.com/questions/3841295/sql-using-alias-in-group-by


### Read Isolation Levels

READ COMMITTED - may see changes to same row between the first time reading it and second the second time.

READ REPEATABLE - same row will appear same both times (so other transactions are unable to commit changes to those rows while another transaction is reading them)

https://msdn.microsoft.com/en-us/library/ms709374(v=vs.85).aspx
https://msdn.microsoft.com/en-us/library/ms378149(v=sql.110).aspx


### Recursive queries (WITH RECURSIVE)
A special kind of Common Table Expression (CTE) (a table expression within a SELECT statement) that lets you do a JOIN recursively.
```
CREATE TABLE department (
    id INTEGER PRIMARY KEY,  -- department ID
    parent_department INTEGER REFERENCES department, -- upper department ID
    name TEXT -- department name
);

INSERT INTO department (id, parent_department, "name")
VALUES
     (0, NULL, 'ROOT'),
     (1, 0, 'A'),
     (2, 1, 'B'),
     (3, 2, 'C'),
     (4, 2, 'D'),
     (5, 0, 'E'),
     (6, 4, 'F'),
     (7, 5, 'G');

-- department structure represented here is as follows:
--
-- ROOT-+->A-+->B-+->C
--      |         |
--      |         +->D-+->F
--      +->E-+->G

-- To extract all departments under A
WITH RECURSIVE subdepartment AS
(
    -- non-recursive term, evaluated first and then used in recursive term
    SELECT * FROM department WHERE name = 'A'

    UNION ALL

    -- recursive term
    SELECT d.*
    FROM
        department AS d
    JOIN
        subdepartment AS sd  -- subdepartment is a recursive reference
        ON (d.parent_department = sd.id)
)
SELECT *
FROM subdepartment
ORDER BY name;
```

https://wiki.postgresql.org/wiki/CTEReadme#Usage


### Bushy joins
* Join where operands are intermediate outputs of other joins

http://tonyhasler.wordpress.com/2008/12/27/bushy-joins/