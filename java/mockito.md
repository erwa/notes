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