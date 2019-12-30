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