### Disable Checkstyle for part of source code file

```
//CHECKSTYLE:OFF
i++;
//CHECKSTYLE:ON
```

http://stackoverflow.com/questions/4023185/how-to-disable-a-particular-checkstyle-rule-for-a-particular-line-of-code


### Skip file

In `checkstyle.xml`:

```
  <module name="SuppressionFilter">
    <property name="file" value="suppressions.xml"/>
  </module>
```

In `suppresions.xml`:

```
<suppressions>
  <suppress files="foo\.java" checks=".*"/>
  <suppress files="bar\.java" checks=".*"/>

  <!-- ignore all files in generated directory -->
  <suppress files="/generated/" checks=".*"/>
</suppressions>
```

http://stackoverflow.com/questions/1012407/how-to-suppress-all-checks-for-a-file-in-checkstyle