### Related objects references

```
from django.db import models

class Reporter(models.Model):
    # ...
    pass

class Article(models.Model):
    reporter = models.ForeignKey(Reporter, on_delete=models.CASCADE)

# can access article via reporter using reporter.article_set
```

https://docs.djangoproject.com/en/3.1/ref/models/relations/


### See constraints on table

```
select sql from sqlite_master where type='table' and name='example_table';
```

https://stackoverflow.com/questions/9636053/is-there-a-way-to-get-the-constraints-of-a-table-in-sqlite


### Show tables

```
.tables
```


### Describe table

```
PRAGMA table_info(my_table);
-- example output:
-- num
--  name
--     data type
--           nullable
--             default
--                pk? (1 if part of pk)
-- 0|id|integer|1||1

-- alternative
.schema MY_TABLE
```

https://stackoverflow.com/questions/3330435/is-there-an-sqlite-equivalent-to-mysqls-describe-table