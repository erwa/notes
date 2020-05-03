### Pretty print JSON

```
curl ... | json_pp
```

https://til.hashrocket.com/posts/pgyjvtuwba-pretty-print-json-responses-from-curl


### Curl with Kerberos

```
curl --negotiate -u : <URL>
```

https://stackoverflow.com/questions/38509837/when-using-negotiate-with-curl-is-a-keytab-file-required


### Post

```
curl -H "Content-Type: application/json" -d '{"event": {"type": "member_left_channel", "user":"UQWGEV4UU", "channel": "test-meta"}}' -X POST http://localhost:8000/puzzles/slack_events/

curl -X POST https://example.com/endpoint

curl https://example.com/endpoint --data "foo=bar&baz=qux" -H "Custom Header: Foo"
```

https://gist.github.com/subfuzion/08c5d85437d5d4f00e58