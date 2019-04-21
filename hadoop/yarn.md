### Stack trace of RM

http://<host>:8088/stacks


### YARN top

Debugging

```
yarn top -queues <queuename>
```


### Change log level

Use http://<host>:<port>/logLevel or

```
hadoop daemonlog -setlevel http://<host>:<port> org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.LeafQueue <level>
```


### Set queue

```
set mapreduce.job.queuename = my_queue_name;
```


### Maximum applications per queue

By default, it's yarn.scheduler.capacity.maximum-applications times the absolute configured capacity of the queue.


### Get node status

```
curl -k --negotiate -u : -X GET "http://rm_host:8088/ws/v1/cluster/nodes/slave_node:8041"
```


### Get current configuration

```
curl --negotiate -u : "http://<rm_host>:8088/ws/v1/cluster/scheduler-conf" | python -m json.tool > conf.xml
```


### Update global configuration

```
yarn schedulerconf -global yarn.resource-types.yarn.io/gpu.maximum-allocation=6
```


### Update queue configuration

```
yarn schedulerconf -update "root.foo.foo_bar:minimum-user-limit-percent=20"
yarn schedulerconf -update "root.foo.bar:accessible-node-labels.test.minimum-user-limit-percent=100"
```


### Change capacity of queue in partition

```
# need to set all queues at one level simultaneously
yarn schedulerconf -update "root.default:accessible-node-labels.cpu.capacity=2;root.bar:accessible-node-labels.cpu.capacity=1;root.qux:accessible-node-labels.cpu.capacity=3;root.baz:accessible-node-labels.cpu.capacity=84;root.misc:accessible-node-labels.cpu.capacity=10"

# Don't forget to set root capacity!
yarn schedulerconf -update "root.foo.bar:accessible-node-labels.test.capacity=100"
yarn schedulerconf -update "root.foo:accessible-node-labels.test.capacity=100"
yarn schedulerconf -update "root:accessible-node-labels.test.capacity=100"
```


### Get capacity scheduler conf

```
curl --negotiate -u : "http://<host>:8088/ws/v1/cluster/scheduler-conf"
```


### Absolute capacity

You don't set this directly; it just tells you percentages relative to whole cluster rather than relative to parent queue.


### Scheduling protocol

allocate() method is synchronous, so initial request for N containers will probably return no allocated containers
because the scheduler hasn't gotten a chance to process the request yet.
If AM changes its might and calls allocate() again with a different number of containers M, that will replace the
initial request. Eventually, RM will get the AM M containers rather rather N + M containers.


### Gang scheduling

Still in development.

YARN-624: Support gang scheduling in the AM RM protocol


### Interesting JIRAs

https://issues.apache.org/jira/browse/YARN-8135 - Hadoop {Submarine} Project: Simple and scalable deployment of deep learning training / serving jobs on Hadoop

https://issues.apache.org/jira/browse/YARN-5139 - [Umbrella] Move YARN scheduler towards global scheduler


### Enable GPU support

Add `resource-types.xml` file containing:

```
<configuration>
  <property>
    <name>yarn.resource-types</name>
    <value>yarn.io/gpu</value>
  </property>
</configuration>
```


### Node label exclusivity

Node labels are exclusive by default, meaning idle resources are NOT shared with the <default> partition.

https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/NodeLabel.html#Addmodify_node_labels_list_to_YARN


### Add node label

```
yarn rmadmin -addToClusterNodeLabels testlabel
```

https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/NodeLabel.html#Addmodify_node_labels_list_to_YARN


### Delete node label

```
yarn rmadmin -removeFromClusterNodeLabels ahsu
```

https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YarnCommands.html#rmadmin


### Remove node labels from node

If you delete a node label that has nodes in it, they get moved to the default partition (no node label).


### Replace labels on nodes / update node labels

Move to default partition

```
yarn rmadmin -replaceLabelsOnNode "host.example.com:1234=,"
```

```
yarn rmadmin -replaceLabelsOnNode host.example.com=test
```

https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YarnCommands.html#rmadmin

```
# Note space-separated!
yarn rmadmin -replaceLabelsOnNode "node1[:port]=label1 node2=label2" [-failOnUnknownNodes]
```

https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/NodeLabel.html#Addmodify_node-to-labels_mapping_to_YARN