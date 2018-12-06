### Log messages to search for for failed job

```
ERROR Ended Job
Error during job, obtaining debugging information...
ERROR Examining task ID
```


### Specify start for logs

http://<host>:8042/node/containerlogs/<container_id>/<user>/stderr/?start=49000000

Can also add `end=XXX`.

http://<host>:8042/node/containerlogs/<container_id>/<user>/amstdout.log/?start=-3000000&end=-1000000


### Running examples in IDEA

In Run configurations, under "Use classpath of module", select 'Include dependencies with "Provided" scope'.


### Finding logs

If not available in Job History Server or ResourceManager, try running `yarn logs` from the CLI.