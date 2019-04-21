### Link to external URL

```
/**
 * @see <a href="http://google.com">http://google.com</a>
 */
```

https://stackoverflow.com/questions/1082050/linking-to-an-external-url-in-javadoc


### Javadoc Style Guide

`@param PARAM  DESCRIPTION` - you can add spaces between `PARAM` and `DESCRIPTION` to line up all the descriptions.

http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html#@param

Start with a verb, 3rd person descriptive. Say something beyond method name.

http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html#styleguide


### Javadoc

For examples, scan through http://www.oracle.com/technetwork/articles/java/index-137868.html.

Javadoc comments inside methods are ignored.

https://stackoverflow.com/questions/15496472/does-the-javadoc-tool-recognize-comments-inside-methods


### Print value of static variable

```
{@value #STATIC_FIELD}
```

https://www.codeproject.com/Articles/658382/Basic-Javadoc-guide


### Reference method

```
/** See also the method {@link #myMethod(String)}. */
```

http://stackoverflow.com/questions/5915992/how-to-reference-a-method-in-javadoc


### Reference method parameter in method Javadoc

```
{@code paramName}
```

http://stackoverflow.com/questions/1667212/how-to-add-reference-to-a-method-parameter-in-javadoc


### `{@code MyClassName}`

https://blogs.oracle.com/darcy/entry/javadoc_tip_code_and_literal


### Link to class

`{@link InputStream}`