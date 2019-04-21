### XInclude

```
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
  <xi:include href="/path/to/foobar.xml">
    <xi:fallback>
      <property>
        <name>my.secret.password</name>
        <value>REPLACE_ME</value>
      </property>
    </xi:fallback>
  </xi:include>
</configuration>
```