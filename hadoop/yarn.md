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


### Replace labels on nodes

```
yarn rmadmin -replaceLabelsOnNode host.example.com=test
```

https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YarnCommands.html#rmadmin