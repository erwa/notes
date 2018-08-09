### Logging

Print statements in `@BeforeClass` don't show up in test results HTML page.


### Disable test

```
@Test(enabled = false)
```

https://stackoverflow.com/questions/6209177/how-to-disable-entire-unit-test-in-testng


### Setup method for class

```
  @BeforeClass
  public void setUp() {
    ...
  }
```


### Expected Exceptions

```
  @Test(expectedExceptions = ArithmeticException.class)
  public void divisionWithException() {
    int i = 1 / 0;
  }
```

http://www.mkyong.com/unittest/testng-tutorial-2-expected-exception-test/