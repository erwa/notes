### Writing Unit Test for Component that Uses Guice

```
public class FooBar {
  private FooService fooService;
  private BarManager barManager;

  @Inject FooBar(FooService fooService, BarManager barManager) {
    this.fooService = fooService;
    this.barManager = barManager;
  }

  int compute() {
    return fooService.getSomething() + barManager.getSomethingElse();
  }
}

public class Test {
  @Mock FooService fooService;
  @Mock BarManager barManager;

  @Test public void testCompute() {
    // stubbing method calls
    when(fooService.getSomething()).thenReturn(41);
    when(barManager.getSomethingElse()).thenReturn(1);

    // direct instantiation
    FooBar fooBar = new FooBar(fooService, barManager);

    assertEquals(42, fooBar.compute());
  }
}
```

https://github.com/google/guice/issues/1115


### Binding

```
// bind ServiceImpl to itself
bind(ServiceImpl.class);
```

https://google.github.io/guice/api-docs/latest/javadoc/index.html?com/google/inject/AbstractModule.html


### Overview

https://github.com/google/guice/wiki/Motivation
https://github.com/google/guice/wiki/GettingStarted

An "injector" is Guice's object-graph builder. Modules configure dependencies, binding types to their implementations.