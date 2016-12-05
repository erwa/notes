### Scanning all partitions accidentally

Use `set hive.limit.query.max.table.partition = 100;` to help prevent accidentally shooting yourself in the foot.

Make sure you use parentheses in where clauses that mix AND and OR clauses.

Make sure you use quotes around the partition values when necessary.