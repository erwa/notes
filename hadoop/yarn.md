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


### Remove node label

If you delete a node label that has nodes in it, they get moved to the default partition (no node label).


### Replace labels on nodes / update node labels

```
yarn rmadmin -replaceLabelsOnNode host.example.com=test
```

https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YarnCommands.html#rmadmin

```
yarn rmadmin -replaceLabelsOnNode "node1[:port]=label1 node2=label2" [-failOnUnknownNodes]
```

https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/NodeLabel.html#Addmodify_node-to-labels_mapping_to_YARN