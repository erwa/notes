### Curl with Kerberos

```
curl --negotiate -u : <URL>
```

https://stackoverflow.com/questions/38509837/when-using-negotiate-with-curl-is-a-keytab-file-required


### Post

```
curl -X POST https://example.com/endpoint

curl https://example.com/endpoint --data "foo=bar&baz=qux" -H "Custom Header: Foo"
```