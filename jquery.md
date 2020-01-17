### Get form fields

```
let values = {};
$.each($('#myForm').serializeArray(), function(i, field) {
    values[field.name] = field.value;
});
```

https://stackoverflow.com/questions/169506/obtain-form-input-fields-using-jquery


### `$(function() {...});`

Short for

```
$(document).ready(function() { ... });
```

https://stackoverflow.com/questions/7642442/what-does-function-do