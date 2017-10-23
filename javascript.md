### Triple equals
`===` and `!==` are strict comparisons, meaning they expect types to be the same.

https://stackoverflow.com/questions/523643/difference-between-and-in-javascript


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