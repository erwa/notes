### See compression codec of file

Use getmeta command in Avro tools.


### Reuse record type already defined

```
"type" : "com.foo.MyRecord"
```


### Specific Record creation via reflection

```
SpecificData.get().newRecord()
```


### Create GenericRecord

```
// parse from String
Schema schema = new Schema.Parser().parse("<schema string>");

Schema schema = new Schema.Parser().parse(new File("user.avsc"));
GenericRecord user1 = new GenericData.Record(schema);
user1.put("name", "Alyssa");
user1.put("favorite_number", 256);
```
https://avro.apache.org/docs/1.7.7/gettingstartedjava.html#Creating+users


### Union types

If the field has a default value, the default value must be the first type listed in the union.

https://issues.apache.org/jira/browse/AVRO-1803


### Union literal

```
# type ["int"]
{"a": {"int": 1}}
```

### Read file from HDFS

```
Path path = new Path("/path/on/hdfs");
Configuration config = new Configuration(); // make this your Hadoop env config
SeekableInput input = new FsInput(path, config);
DatumReader<GenericRecord> reader = new GenericDatumReader<GenericRecord>();
FileReader<GenericRecord> fileReader = DataFileReader.openReader(input, reader);

for (GenericRecord datum : fileReader) {
    System.out.println("value = " + datum);
}

fileReader.close(); // also closes underlying FsInput
```
http://stackoverflow.com/questions/11632067/reading-a-simple-avro-file-from-hdfs


### Read local Avro file

```
FileReader<GenericRecord> reader = DataFileReader.openReader(new File(filename), new GenericDatumReader());

for (GenericRecord datum : reader) {
   String value = datum.get(1).toString();
   System.out.println("value = " + value);
}

reader.close();
```


### How to read an Avro file

http://stackoverflow.com/questions/11632067/reading-a-simple-avro-file-from-hdfs


### Retrieve Avro schema from binary Avro file

http://www.michael-noll.com/blog/2013/03/17/reading-and-writing-avro-files-from-the-command-line/

```
java -jar /export/apps/avro/avro-tools-1.7.5.jar getschema recursive.avro > recursive.avsc
java -jar /opt/avro/avro-tools-1.7.7.jar getschema twitter.avro > twitter.avsc
```

### Read schema from file

```
Schema s = new Schema.Parser().parse(new File("/home/ahsu/recursive.avsc"));
```


### Convert JSON to binary Avro

http://www.michael-noll.com/blog/2013/03/17/reading-and-writing-avro-files-from-the-command-line/#converting-to-and-from-binary-avro

```
java -jar /export/apps/avro/avro-tools-1.7.5.jar fromjson --schema-file string.avsc string.json > string.avro
java -jar /opt/avro/avro-tools-1.7.7.jar fromjson --schema-file test_avro_map_union.avsc test_avro_map_union.json > test_avro_map_union.avro
```

Example twitter.json file:

```
{"username":"miguno","tweet":"Rock: Nerf paper, scissors is fine.","timestamp": 1366150681 }
{"username":"BlizzardCS","tweet":"Works as intended.  Terran is IMBA.","timestamp": 1366154481 }
```

Convert binary Avro to JSON

```
# Leave off "> JSON_FILE" part to output to stdout
java -jar lib/avro-tools-*.jar tojson AVRO_FILE > JSON_FILE
java -jar /opt/avro/avro-tools-1.7.7.jar tojson AVRO_FILE > JSON_FILE
```

### Gotchas

Setting "avro.java.string" : "String" can cause issues

### Avro Maps

http://avro.apache.org/docs/1.7.6/spec.html#Maps

Keys are assume to be strings.