3 types of servers:
* region servers - handles reads and writes
* HBase Master - handles DDL commands, region assignment
* ZooKeeper - maintains cluster state

Region servers
- clients communicate directly with these to do reads and writes

Each Region Server colocated with a DataNode

=== HBase Table
- divided horizontally by row key into "regions"
- regions are assigned to Region Servers by HBase master
- each Region Server can server about 1000 regions


=== HBase Master
- assigns regions on start-up
- reassigns regions for recovery / load-balancing
- monitors all RegionServers (ZooKeeper notification will let HBase Master know a RegionServer has failed)
- interface for creating/deleting tables


=== ZooKeeper
- keeps tracks of which servers are alive and available
- provides server failure notification
- Region Servers and HMaster connect with session to ZK, ephemeral nodes store in ZK for each active session. Kept active using heartbeats.

HMasters decide who is active by whoever wins in creating ephemeral node in ZK.

Inactive HMaster listens for ZK notifications of active HMaster's death

When a region server fails, active HMaster will recover those regions.


=== META table
ZK stores a .META table that contains the location of all regions in cluster

When client first connects to HBase, it contacts ZK and gets the region server storing the .META table. It then contacts that region server and queries the .META table for the region server containing the row keys of interest.

.META location and region server ranges are cached locally on client-side.

META table is like B-tree.
Key = table, region start key, region id
Value = RegionServer


=== Region Server
- uses Write-Ahead Log
- BlockCache: in-memory read cache for frequently read data. Evicts based on LRU.
- MemStore: in-memory write cache. Stores new data not yet written to disk. Sorts data before writing. One MemStore per column family per region.

Hfiles store rows as sorted KVs on disk


=== Anatomy of a Write
- client makes PUT request to RegionServer
- first written to Write-Ahead Log (append-only)
- update written to MemStore
- PUT request acknowledged (can now read-your-write)

HBase MemStore stores update in memory as sorted KVs, same as layout of HFile.
- updates are sorted per column family


=== Column Family
- all columns in column family stored in same regionfile.
- different column families stored in separate regionfiles.

Hbase column = column family + column qualifier.
Column families for a table must be created up-front. Columns can be added on the fly to a column family.

Number of column families should be kept small (e.g.: <= 3)

https://www.quora.com/HBase-What-is-a-column-family/answer/William-Frank-1

Every value in HBase has key, which is table -> row -> column family -> column -> version

https://www.mapr.com/blog/hbase-and-mapr-db-designed-distribution-scale-and-speed#.VcKFNflVhBc

Each HBase table cell consists of a key + value.
Key = row key + column family + column qualifier + timestamp.
Value is the actual value.
Entire key is stored for each cell value.

(Table -> Row -> Family -> Column -> Timestamp) -> Value
Each cell is an array of bytes.
HBase tables should be sparsely populated.

How many versions to store per cell is configurable. Default is 3.

HFile
- includes multi-layered index, which allows for quick seeking
- 64 KB blocks, each block has own idnex

Seems similar to ORC file.
root index -> intermediate index -> leaf index
HFile contains Bloom Filter at end.


=== Read
1) check BlockCache
2) check MemStore
3) check HFile


Minor compactions and major compactions to handle the flushing of MemStore.

Each region 3-20 GB.

When Region is split, new Region created, but data may be remote until major compaction happens.


Pros
* strong consistency: all readers see same value when write returns
* scales automatically (regions split automatically when too large)

Drawbacks
* slow complex crash recovery
* WAL replay is slow
* major compaction uses a lot of I/O and network

HBase allows for atomic updates across column families with row.
https://hbase.apache.org/acid-semantics.html

Table scan does NOT exhibit snapshot isolation. Supports READ COMMITTED.


Has Observer interface -- hooks for Region, WAL, and Master events (RegionObserver, WALObserver, MasterObserver).