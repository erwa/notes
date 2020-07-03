### Expect exception / expect an exception

```
@Test(expected = NullPointerException.class)
public void whenExceptionThrown_thenExpectationSatisfied() {
    String test = null;
    test.length();
}
```

https://www.baeldung.com/junit-assert-exception#junit-4


### Parameterized tests

`@Parameterized`

Instances created for cross-product of test methods and test data elements.


### `@BeforeClass` vs. `@Before`

```
@BeforeClass // Causes method to be run ONCE for the class before any @Tests are run
@Before // Run before EVERY @Test
```