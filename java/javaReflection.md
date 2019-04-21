### Reflections

```
//scan urls that contain 'my.package', include inputs starting with 'my.package', use the default scanners
Reflections reflections = new Reflections("my.package");

//or using ConfigurationBuilder
new Reflections(new ConfigurationBuilder()
     .setUrls(ClasspathHelper.forPackage("my.project.prefix"))
     .setScanners(new SubTypesScanner(),
                  new TypeAnnotationsScanner().filterResultsBy(optionalFilter), ...),
     .filterInputsBy(new FilterBuilder().includePackage("my.project.prefix"))
     ...);
```

https://github.com/ronmamo/reflections


### Get all classes in package

```
Reflections reflections = new Reflections("com.linkedin.compliance.udfs", new SubTypesScanner(false));

Set<Class<?>> udfs = reflections.getSubTypesOf(Object.class);
```

https://stackoverflow.com/questions/520328/can-you-find-all-classes-in-a-package-using-reflection


### `getMethod()` vs `getDeclaredMethod()`

`getMethod()` only returns public methods.

https://coderanch.com/t/366914/java/getMethod-getDeclaredMethod
https://stackoverflow.com/questions/43585019/java-reflection-difference-between-getmethods-and-getdeclaredmethods


### Invoke static method via reflection

```
// String.class here is the parameter type, that might not be the case with you
Method method = clazz.getMethod("methodName", String.class);
Object o = method.invoke(null, "whatever");
```

https://stackoverflow.com/questions/2467544/invoking-a-static-method-using-reflection


### Access private field

```
B b = new B();
Field[] fs = b.getClass().getSuperclass().getDeclaredFields();
fs[0].setAccessible(true);
System.out.println(fs[0].get(b));
```

http://stackoverflow.com/questions/3567372/access-to-private-inherited-fields-via-reflection-in-java