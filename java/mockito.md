### Verify method never called

```
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;

// ...

verify(dependency, never()).someMethod();
```

https://stackoverflow.com/questions/12862659/how-to-verify-that-a-specific-method-was-not-called-using-mockito


### How does Mockito work

https://stackoverflow.com/questions/14440270/how-does-mockito-when-invocation-work


### Mock fluent APIs using deep stubbing

```
@Test
public void givenDeepMocks_whenServiceInvoked_thenPizzaIsBuilt() {
    PizzaBuilder builder = Mockito.mock(Pizza.PizzaBuilder.class, Mockito.RETURNS_DEEP_STUBS);
 
    Mockito.when(builder.name(anyString())
      .size(any(Pizza.PizzaSize.class))
      .withExtraTopping(anyString())
      .withStuffedCrust(anyBoolean())
      .withExtraTopping(anyString())
      .willCollect(anyBoolean())
      .applyDiscount(anyInt())
      .build())
      .thenReturn(expectedPizza);
 
    PizzaService service = new PizzaService(builder);
    Pizza pizza = service.orderHouseSpecial();
    assertEquals("Expected Pizza", expectedPizza, pizza);
}
```

https://www.baeldung.com/mockito-fluent-apis#deep-mocking


### Mock final classes

Create file `src/test/resources/mockito-extensions/org.mockito.plugins.MockMaker` with contents:

```
mock-maker-inline
```

https://www.baeldung.com/mockito-final


### Use `@Mock` annotation

```
@RunWith(MockitoJUnitRunner.class)
public class MyTest {
  @Mock
  List<String> mockedList;

  @Test
  public void whenUseMockAnnotation_thenMockIsInjected() {
      mockedList.add("one");
      ...
```

https://www.baeldung.com/mockito-annotations


### `when().thenReturn()`

```
Comparable<String> c= mock(Comparable.class);
when(c.compareTo("Mockito")).thenReturn(1);
when(c.compareTo("Eclipse")).thenReturn(2);
```

https://www.vogella.com/tutorials/Mockito/article.html