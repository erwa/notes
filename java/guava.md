### LoadingCache

```
private LoadingCache<Foo, Bar> myCache = CacheBuilder.newBuilder().build(
    CacheLoader.from(foo -> loadBar(foo)));
```