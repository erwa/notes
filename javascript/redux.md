### createAsyncThunk

```
createAsyncThunk(action_prefix, payload_creator)

export const fetchTodos = createAsyncThunk('todos/fetchTodos', async () => {
  const response = await client.get('/fakeApi/todos')
  return response.todos
})
```

https://redux.js.org/tutorials/fundamentals/part-8-modern-redux#using-createasyncthunk
