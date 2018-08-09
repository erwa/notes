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