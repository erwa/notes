# How to read an Avro file
# http://stackoverflow.com/questions/11632067/reading-a-simple-avro-file-from-hdfs

# Retrieve Avro schema from binary Avro file
# http://www.michael-noll.com/blog/2013/03/17/reading-and-writing-avro-files-from-the-command-line/
java -jar /export/apps/avro/avro-tools-1.7.5.jar getschema recursive.avro > recursive.avsc

# Read schema from file
Schema s = new Schema.Parser().parse(new File("/home/ahsu/recursive.avsc"));

# Extract schema from .avro file
# http://www.michael-noll.com/blog/2013/03/17/reading-and-writing-avro-files-from-the-command-line/#retrieve-avro-schema-from-binary-avro
java -jar /opt/avro/avro-tools-1.7.7.jar getschema twitter.avro > twitter.avsc

# Convert JSON to binary Avro
# http://www.michael-noll.com/blog/2013/03/17/reading-and-writing-avro-files-from-the-command-line/#converting-to-and-from-binary-avro
java -jar /export/apps/avro/avro-tools-1.7.5.jar fromjson --schema-file string.avsc string.json > string.avro
java -jar /opt/avro/avro-tools-1.7.7.jar fromjson --schema-file test_avro_map_union.avsc test_avro_map_union.json > test_avro_map_union.avro

# Example twitter.json file
{"username":"miguno","tweet":"Rock: Nerf paper, scissors is fine.","timestamp": 1366150681 }
{"username":"BlizzardCS","tweet":"Works as intended.  Terran is IMBA.","timestamp": 1366154481 }

# Convert binary Avro to JSON
# Leave off "> JSON_FILE" part to output to stdout
java -jar lib/avro-tools-*.jar tojson AVRO_FILE > JSON_FILE
java -jar /opt/avro/avro-tools-1.7.7.jar tojson AVRO_FILE > JSON_FILE

# Setting "avro.java.string" : "String" can cause issues

### Avro Maps
http://avro.apache.org/docs/1.7.6/spec.html#Maps

Keys are assume to be strings.