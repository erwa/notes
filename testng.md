### Expected Exceptions
```
  @Test(expectedExceptions = ArithmeticException.class)
  public void divisionWithException() {
    int i = 1 / 0;
  }
```
http://www.mkyong.com/unittest/testng-tutorial-2-expected-exception-test/