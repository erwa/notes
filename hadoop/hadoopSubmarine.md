### Zeppelin Submarine Interpreter

https://www.youtube.com/watch?v=zKS50-4LZzg

Launch Submarine job from Zeppelin notebook, includes TensorBoard and YARN RM links. Does real-time monitoring.


### Zeppelin + Submarine + Azkaban integration

https://www.youtube.com/watch?v=p-RYhy7ngfE

```
%submarine
dashboard
```

UI to help fill in command

Can execute a paragraph name.

Submarine Web link

YARN log
TensorBoard

```
%submarine.azkaban

Paragraphs=...
dependencies=...
```


### Zeppelin integration design doc

https://docs.google.com/document/d/16YN8Kjmxt1Ym3clx5pDnGNXGajUT36hzQxjaik1cP4A/edit#

- store files on HDFS
- `%Submarine.python` to run Python commands in interpreter on YARN GPU host
- `%Submarine.command` to submit scheduled execution to Hadoop

