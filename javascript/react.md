### useEffect

Conditionally fire an effect by passing an array of values as the second argument.

```
useEffect(
  () => {
    const subscription = props.source.subscribe();
    return () => {
      subscription.unsubscribe();
    };
  },
  [props.source],  // effect only fires if props.source changes
);
```

https://reactjs.org/docs/hooks-reference.html#conditionally-firing-an-effect