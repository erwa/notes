### Event handler return value

`true` means to continue event chain. `false` means to stop chain.

https://www.permadi.com/tutorial/jsEventBubbling/index.html


### Append to array

```
// initialize array
var arr = ["Hi", "Hello", "Bonjour", "Hola"];

// append multiple values to the array
arr.push("Salut", "Hey");
```

https://stackoverflow.com/questions/351409/how-to-append-something-to-an-array


### Check if object is an array

```
Array.isArray(obj)
```

https://stackoverflow.com/questions/4775722/how-to-check-if-an-object-is-an-array


### Length of array

```
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.length;
```

https://www.w3schools.com/jsref/jsref_length_array.asp


### Site to test CORS

https://cors-anywhere.herokuapp.com/ - responds with `access-control-allow-origin` header set

https://stackoverflow.com/questions/43871637/no-access-control-allow-origin-header-is-present-on-the-requested-resource-whe


### let vs. var

let-defined variables only accessible in immediate surrounding `{}` block. `var`'s scope is enclosing function.

```
function run() {
  var foo = "Foo";
  let bar = "Bar";

  console.log(foo, bar);

  {
    let baz = "Bazz";
    console.log(baz);
  }

  console.log(baz); // ReferenceError
}

run();
```

https://stackoverflow.com/questions/762011/whats-the-difference-between-using-let-and-var


### Transform array, applying function to each element

```
const numbers = [1,2,3,4,5];
const doubled = numbers.map(n => n * 2);
```

https://stackoverflow.com/questions/3010840/loop-through-an-array-in-javascript


### Iterate over array

```
const array = ["one", "two", "three"]
array.forEach(function (item, index) {
  console.log(item, index);
});

let colors = ['red', 'green', 'blue'];
for (const color of colors){
  console.log(color);
}

// avoid for ... in ... as it will enumerate *object properties*
```

https://stackoverflow.com/questions/3010840/loop-through-an-array-in-javascript


### Define multiple variables at once

```
var a = 5
  , b = 2
  , c = 3
  , d = {}
  , e = [];
```

https://stackoverflow.com/questions/4166785/javascript-how-to-define-multiple-variables-on-a-single-line


### Multiline strings

Use template literals (since ECMAScript 6).

```
var html = `
  <div>
    <span>Some HTML here</span>
  </div>
`;
```

https://stackoverflow.com/questions/805107/creating-multiline-strings-in-javascript


### `event.clientX` vs. `event.X`

`clientX` is relative to window; `x` is relative to parent element.

https://stackoverflow.com/questions/21512103/event-clientx-and-event-clienty-vs-event-x-and-event-y


### `Node` vs `Element`

`Node` is any node; `Element` is a specific kind of `Node`.

https://stackoverflow.com/questions/9979172/difference-between-node-object-and-element-object


### Creating `Range`s

```
var r = document.createRange();
r.selectNodeContents(node);

r = document.caretRangeFromPoint(x, y);
```


### Triple equals

`===` and `!==` are strict comparisons, meaning they expect types to be the same.

https://stackoverflow.com/questions/523643/difference-between-and-in-javascript


### String equality

```
"a" == "b"

// or

"a" === "b"

// false
new String("a") == new String("a")
new String("a") === new String("a")

// true
new String("a").valueOf() == new String("a").valueOf()
new String("a").valueOf() === new String("a").valueOf()
```

https://stackoverflow.com/questions/3586775/what-is-the-correct-way-to-check-for-string-equality-in-javascript


### String contains

```
var str = "Hello world, welcome to the universe.";

// ECMAScript 6
var n = str.includes("world");

var string = "foo",
    substring = "oo";
string.indexOf(substring) !== -1;
```

* https://stackoverflow.com/questions/1789945/how-to-check-whether-a-string-contains-a-substring-in-javascript
* https://www.w3schools.com/jsref/jsref_includes.asp


### Array to String

```
var fruits = ["Banana", "Orange", "Apple", "Mango"];
var energy = fruits.join(); // default delimiter is ,
```
https://www.w3schools.com/jsref/jsref_join.asp


### Concat arrays

```
var hege = ["Cecilie", "Lone"];
var stale = ["Emil", "Tobias", "Linus"];
var children = hege.concat(stale);
```
https://www.w3schools.com/jsref/jsref_concat_array.asp


### Remove last character from string

```
str.slice(0, -1);
```

https://stackoverflow.com/questions/952924/javascript-chop-slice-trim-off-last-character-in-string


### Clone array

```
var clone = myArray.slice(0);
```


### For Loops

```
// regular for loop
var i;
for (i = 0; i < cars.length; i++) {
    text += cars[i] + "<br>";
}


// for in loop
var person = {fname:"John", lname:"Doe", age:25};

var text = "";
var x;
for (x in person) {
    text += person[x];
}
```


### Random integer

```
// Generate random integer in [low, high)
// http://blog.tompawlak.org/how-to-generate-random-values-nodejs-javascript
function randomInt (low, high) {
    return Math.floor(Math.random() * (high - low) + low);
}
```