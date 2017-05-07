### Log Structured Merge Trees (LSM Trees)

http://www.benstopford.com/2015/02/14/log-structured-merge-trees/

In-memory table for fast writes.
Periodically flush to disk, creating SSTables (sorted string tables) on disk. Index for each SSTable stored in memory.
SSTables periodically merged. SSTables are sorted and immutable.

Reads check in-memory table and SSTable indexes, if present in SSTable, fetch from SSTable. Can use in-memory index and bloom filters to speed up reads.