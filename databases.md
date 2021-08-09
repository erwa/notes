### Snapshot isolation transaction anomalies

Snapshot isolation can still have anomalies that serializable does not have:

* write skew anomaly where 2 txns read overlapping data sets (v1, v2) and update disjoint data sets: t1 updates v1, t2 updates v2. Neither transaction saw the other's writes before committing.

* read-only transaction anomaly. Read-only transaction can return a result that makes one believe something shouldn't have happened, but because transactions can commit out-of-order, you can get unexpected results. For details, see example 1.3 in https://sigmodrecord.org/publications/sigmodRecord/0409/2.ROAnomONeil.pdf


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
