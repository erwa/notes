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