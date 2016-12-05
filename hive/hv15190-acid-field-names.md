```
Caused by: org.apache.derby.iapi.error.StandardException: Table/View 'DBS' does not exist.
```

Need to set the following in hive-site.xml:
```
  <property>
    <name>hive.metastore.schema.verification</name>
    <value>false</value>
  </property>
  
  <property>
    <name>datanucleus.schema.autoCreateAll</name>
    <value>true</value>
  </property>
```

```
Unknown token: [@-1,0:0='TOK_FILEFORMAT_GENERIC',<679>,0:-1]
```
Unclean build. Rebuild with `clean`.


Setup:
```
drop table if exists orc_acid;
create table orc_acid (a int) clustered by (a) into 2 buckets stored as orc TBLPROPERTIES('transactional'='true');
insert into table orc_acid values(1), (2);
```

Check ORC file. Use `desc formatted orc_acid` to find table location.
```
hive --orcfiledump bucket_00000

hive --service orcfiledump bucket_00000
```

`columns` and `columns.types` get set by DDLSemanticAnalyzer. Duplicated in tons of places: IOConstants, serdeConstants, hive_metastoreConstants.

Put `fromTableProperties` in OrcRecordUpdater.java.

HIVE-12159: Added OrcUtils.convertTypeFromProtobuf
By Hive 1.2, OrcUtils.convertTypeInfo is not present.
OrcUtils.convertTypeInfo added in HIVE-11981 (Hive 2.0.0) (moved from OrcOutputFormat.java)

stashed WIP in hv15190-wip
HIVE-11890 (2.0.0) moved convertTypeInfo to OrcInputFormat.java.

schema_evol_orc_acid_mapwork_part.q test does not exist, only .out file.


```
# not working
mvn test -Pitests -Dtest=TestCliDriver -Dqfile_regex=schema_evol_orc_acid.*

# not working either
mvn test -Dtest=TestCliDriver -Dqfile_regex='schema_evol_orc_acid.*' 2>&1 | tee temp
```

schema_evol_orc_acid_part.q
schema_evol_orc_acid_part_update.q
schema_evol_orc_acid_table.q
schema_evol_orc_acid_table_update.q
schema_evol_orc_acidvec_part.q
schema_evol_orc_acidvec_part_update.q
schema_evol_orc_acidvec_table.q
schema_evol_orc_acidvec_table_update.q

```
# Not working either
mvn test -Pitests -Dtest=TestCliDriver -Dqfile=schema_evol_orc_acid_part.q,schema_evol_orc_acid_part_update.q,schema_evol_orc_acid_table.q,schema_evol_orc_acid_table_update.q,schema_evol_orc_acidvec_part.q,schema_evol_orc_acidvec_part_update.q,schema_evol_orc_acidvec_table.q,schema_evol_orc_acidvec_table_update.q 2>&1 | tee temp
```
Not working due to multiple TestCliDriver?


Build:
```
mvn install -DskipTests -Dmaven.javadoc.skip=true -Pitests
```

Should use SchemaEvolution.createEventSchema()

```
  @Test
  public void testAcidOrcWritePreservesFieldNames() throws Exception {
    String tableName = "acidorcwritefieldnames";
    runStatementOnDriver("DROP TABLE IF EXISTS " + tableName);
    runStatementOnDriver("CREATE TABLE " + tableName + " (a INT, b STRING) CLUSTERED BY (a) INTO " + BUCKET_COUNT + " BUCKETS STORED AS ORC TBLPROPERTIES ('transactional'='true')");
    runStatementOnDriver("INSERT INTO " + tableName + " VALUES (1, 'foo'), (2, 'bar')");

    FileSystem fs = FileSystem.get(hiveConf);
    FileStatus[] fileStatuses = fs.globStatus(new Path(TEST_WAREHOUSE_DIR + "/" + tableName + "/delta_*/bucket_*"));
    Assert.assertEquals(BUCKET_COUNT, fileStatuses.length);

    ReaderOptions readerOptions = OrcFile.readerOptions(hiveConf);
    for (FileStatus fileStatus : fileStatuses) {
      Reader r = OrcFile.createReader(fileStatus.getPath(), readerOptions);
      TypeDescription rowSchema = r.getSchema().getChildren().get(5);
      List<String> fieldNames = rowSchema.getFieldNames();
      Assert.assertEquals(2, fieldNames.size());
      Assert.assertEquals("a", fieldNames.get(0));
      Assert.assertEquals("b", fieldNames.get(1));
    }
  }
```

```
mvn test -Dtest=TestCliDriver -Dqfile=schema_evol_orc_acid_table.q
```

Need to override disabled tests specified in itests/src/test/resources/testconfiguration.properties
schema_evol_* all part of minillaplocal.query.files

```
# need to specify a dummy test to exclude in -Dminillaplocal.query.files. If empty, falls back to what's
# specified in testconfiguration.properties
mvn test -Dtest=TestCliDriver -Dqfile=schema_evol_orc_acid_table.q -Dminillaplocal.query.files=sample10.q -DinitScript=

# Above fails diff because .q.out for clientpositive doens't exist for this test! Only exists for llap.

# Need to run TestMiniLlapCliDriver
mvn test -Dtest=TestMiniLlapCliDriver ...
```

Update Hive FAQ.

Only tests that failed with qtests:
```
org.apache.hadoop.hive.cli.TestCliDriver.testCliDriver[autoColumnStats_4] (batchId=11)
org.apache.hadoop.hive.cli.TestCliDriver.testCliDriver[insert_values_orig_table_use_metadata] (batchId=57)
org.apache.hadoop.hive.cli.TestMiniLlapCliDriver.testCliDriver[acid_bucket_pruning] (batchId=132)
org.apache.hadoop.hive.cli.TestMiniLlapCliDriver.testCliDriver[orc_ppd_schema_evol_3a] (batchId=133)
org.apache.hadoop.hive.cli.TestMiniLlapCliDriver.testCliDriver[transform_ppr2] (batchId=133)
org.apache.hadoop.hive.cli.TestMiniLlapLocalCliDriver.testCliDriver[join_acid_non_acid] (batchId=150)
org.apache.hadoop.hive.cli.TestMiniLlapLocalCliDriver.testCliDriver[union_fast_stats] (batchId=145)
org.apache.hadoop.hive.cli.TestMiniTezCliDriver.testCliDriver[explainanalyze_2] (batchId=91)
org.apache.hadoop.hive.cli.TestMiniTezCliDriver.testCliDriver[explainanalyze_5] (batchId=90)
org.apache.hadoop.hive.cli.TestMiniTezCliDriver.testCliDriver[explainuser_3] (batchId=90)
org.apache.hadoop.hive.cli.TestSparkCliDriver.org.apache.hadoop.hive.cli.TestSparkCliDriver (batchId=94)
```

```
mvn test -Dtest=TestCliDriver -Dqfile=autoColumnStats_4.q
```

Test failure reasons:

=== TestCliDriver ===
PASSES LOCALLY - file JIRA (filed HIVE-15286)
autoColumnStats_4.q - diff, totalSize - FLAKY. failed for me once when run alone locally with same diff, passed another time.
- on HEAD, passes when run alone

FLAKY, sometimes PASSES LOCALLY - file JIRA (filed HIVE-15287)
insert_values_orig_table_use_metadata - diff, stats, data size, passes locally when run alone.

```
mvn test -Dtest=TestCliDriver -Dqfile=autoColumnStats_4.q,insert_values_orig_table_use_metadata.q
```


=== TestMiniLlapCliDriver ===
PASSES LOCALLY (FLAKY TEST: HIVE-14860)
acid_bucket_pruning - diff stats, total size
- HIVE-14860 for flaky test. jira claims test passes when run alone. locally, also succeeds for me when run alone.

PASSES LOCALLY (FLAKY TEST: HIVE-14936) - post my diff in JIRA
orc_ppd_schema_evol_3a - diff, RECORDS_OUT_INTERMEDIATE_Map_1 changed from 1399/8/4/4 to 1
- HIVE-14936 for flaky test. passes locally when run by itself.
- same thing happened in #2291 precommit (for HIVE-15240)

FLAKY TEST (HIVE-15201)
transform_ppr2 - diff, stats changed from PARTIAL to COMPLETE
- HIVE-15201 for flaky test. diff in HIVE-15201 is same as diff I experienced.

```
mvn test -Dtest=TestMiniLlapCliDriver -Dqfile=acid_bucket_pruning.q,orc_ppd_schema_evol_3a.q,transform_ppr2.q 2>&1 | tee temp
```


=== TestMiniLlapLocalCliDriver ===
PASSES LOCALLY (FLAKY TEST: HIVE-15116)
join_acid_non_acid - diff, ordering, passes locally when run by itself

PASSES LOCALLY (FLAKY TEST: HIVE-15115)
union_fast_stats - diff, totalSize, my diff is exactly the same as reported in HIVE-15115. jira says test passes locally. also passes for me when run locally by itself.

```
# succeeds.
mvn test -Dtest=TestMiniLlapLocalCliDriver -Dqfile=join_acid_non_acid.q,union_fast_stats.q 2>&1 | tee temp
```


=== TestMiniTezCliDriver ===
PASSES LOCALLY (FLAKY TEST: HIVE-15084) - posted diffs in jira
explainanalyze_2 - diff, rows numbers changed
explainanalyze_5 - diff, Group By Operator rows numbers
jira for above 2: HIVE-15084. both succeed locally when only the 2 tests are run.

also FAILS ON HEAD, should file JIRA, link to HIVE-14689 (filed HIVE-15288)
explainuser_3 - diff, Operator width changed
- repros locally when run by itself. same change as in precommit build. also repros on HEAD with same diff.
```
mvn test -Dtest=TestMiniTezCliDriver -Dqfile=explainuser_3.q 2>&1 | tee temp
```



=== TestSparkCliDriver ===
- FLAKY, file ticket, similar thing happened in #2291, filed HIVE-15289
TestSparkCliDriver - Job failed with java.io.IOException: Failed to create local dir in /tmp/blockmgr-be4539eb-7896-4903-89c9-7ae1c48faa24/01
looks unrelated

```
mvn test -Dtest=TestMiniLlapCliDriver -Dqfile=acid_bucket_pruning.q
```



Detailed failures:
=== autoColumnStats_4.q
203c203
<   totalSize             1707
---
>   totalSize             1714
246c246
<   totalSize             2920
---
>   totalSize             2719


=== insert_values_orig_table_use_metadata.q
315c315
<   totalSize             1545
---
>   totalSize             1508
343c343
<             Statistics: Num rows: 1 Data size: 1545 Basic stats: COMPLETE Column stats: COMPLETE
---
>             Statistics: Num rows: 1 Data size: 1508 Basic stats: COMPLETE Column stats: COMPLETE
345c345
<               Statistics: Num rows: 1 Data size: 1545 Basic stats: COMPLETE Column stats: COMPLETE
---
>               Statistics: Num rows: 1 Data size: 1508 Basic stats: COMPLETE Column stats: COMPLETE
439c439
<   totalSize             3091
---
>   totalSize             3016
467c467
<             Statistics: Num rows: 1 Data size: 3091 Basic stats: COMPLETE Column stats: COMPLETE
---
>             Statistics: Num rows: 1 Data size: 3016 Basic stats: COMPLETE Column stats: COMPLETE
469c469
<               Statistics: Num rows: 1 Data size: 3091 Basic stats: COMPLETE Column stats: COMPLETE
---
>               Statistics: Num rows: 1 Data size: 3016 Basic stats: COMPLETE Column stats: COMPLETE
547c547
<   totalSize             380328
---
>   totalSize             380253
575c575
<             Statistics: Num rows: 1 Data size: 380328 Basic stats: COMPLETE Column stats: COMPLETE
---
>             Statistics: Num rows: 1 Data size: 380253 Basic stats: COMPLETE Column stats: COMPLETE
577c577
<               Statistics: Num rows: 1 Data size: 380328 Basic stats: COMPLETE Column stats: COMPLETE
---
>               Statistics: Num rows: 1 Data size: 380253 Basic stats: COMPLETE Column stats: COMPLETE


=== acid_bucket_pruning.q
60c60
<                   Statistics: Num rows: 8965 Data size: 35861 Basic stats: COMPLETE Column stats: NONE
---
>                   Statistics: Num rows: 8983 Data size: 35932 Basic stats: COMPLETE Column stats: NONE
65c65
<                     Statistics: Num rows: 4482 Data size: 17928 Basic stats: COMPLETE Column stats: NONE
---
>                     Statistics: Num rows: 4491 Data size: 17964 Basic stats: COMPLETE Column stats: NONE
69c69
<                       Statistics: Num rows: 4482 Data size: 17928 Basic stats: COMPLETE Column stats: NONE
---
>                       Statistics: Num rows: 4491 Data size: 17964 Basic stats: COMPLETE Column stats: NONE
75c75
<                         Statistics: Num rows: 4482 Data size: 17928 Basic stats: COMPLETE Column stats: NONE
---
>                         Statistics: Num rows: 4491 Data size: 17964 Basic stats: COMPLETE Column stats: NONE
116c116
<                     totalSize 35861
---
>                     totalSize 35932
138c138
<                       totalSize 35861
---
>                       totalSize 35932


=== explainuser_3.q
34c34
<         Select Operator [SEL_7] (rows=16 width=106)
---
>         Select Operator [SEL_7] (rows=16 width=107)
38c38
<             Select Operator [SEL_5] (rows=16 width=106)
---
>             Select Operator [SEL_5] (rows=16 width=107)
40c40
<               TableScan [TS_0] (rows=16 width=106)
---
>               TableScan [TS_0] (rows=16 width=107)


Attempt to run multiple qtests simultaneously:
```
# same problems with patch and without
mvn test -Dtest=TestCliDriver,TestMiniLlapCliDriver -Dqfile=autoColumnStats_4.q,insert_values_orig_table_use_metadata.q,acid_bucket_pruning.q,orc_ppd_schema_evol_3a.q,transform_ppr2.q
```

In test rerun, changes in failed tests:
- TestMiniLlapCliDriver.testCliDriver[orc_ppd_schema_evol_3a]

+ TestMiniLlapLocalCliDriver.testCliDriver[columnstats_part_coltype]
+ TestHBaseCliDriver.testCliDriver[hbase_bulk]

- TestMiniTezCliDriver.testCliDriver[explainanalyze_2]
- TestMiniTezCliDriver.testCliDriver[explainanalyze_5]
+ TestMiniTezCliDriver.testCliDriver[explainanalyze_4]

```
mvn test -Dtest=TestMiniLlapLocalCliDriver -Dqfile=columnstats_part_coltype.q
```