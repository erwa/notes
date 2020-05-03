### Count number of nodes

```
match (n) return count(n);
```

https://neo4j.com/developer/kb/fast-counts-using-the-count-store/


### Count total relationships

```
match ()-->() return count(*);
```

https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887
http://bigdatums.net/2017/01/01/counting-relationships-in-neo4j/