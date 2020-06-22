### JSON to protobuf

```
JsonFormat.parser().merge(json_string, builder);
```

JsonFormat is is com.google.protobuf:protobuf-java-util jar.

https://stackoverflow.com/questions/38406211/how-to-convert-from-json-to-protobuf


### Nested types

```
message SearchResponse {
  message Result {
    required string url = 1;
    optional string title = 2;
    repeated string snippets = 3;
  }
  repeated Result result = 1;
}
```

https://developers.google.com/protocol-buffers/docs/proto#nested