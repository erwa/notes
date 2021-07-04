### Transaction isolation levels

- Serializable
- Repeatable read/snapshot isolation (phantom reads + serialization anomalies possible)
- Read committed (nonrepeatable reads possible + above)
- Read uncommitted (dirty reads allowed + above)

One example of serialization anomaly is reading a control record indicating batch has been processed but not seeing all details of the batch.

https://www.postgresql.org/docs/9.5/transaction-iso.html


### Schema Diagrams

Lines, circles, crows' feet, one-to-many relations, etc.

http://www.databaseanswers.org/tutorial4_db_schema/tutorial_slide_5.htm
