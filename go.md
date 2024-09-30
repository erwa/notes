# Go

### Escape analysis and automatic heap allocation

If you return pointer to local value, Go automatically allocates it on the heap based on escape analysis.

https://stackoverflow.com/questions/13715237/return-pointer-to-local-struct


### Getters

Getter for a field `owner` should be named `Owner`, not GetOwner.

https://golang.org/doc/effective_go.html#Getters


### Trailing comma

```
// Invalid
mapa := map[string]string{
        "jedan":"one",
        "dva":"two"
       }

// Valid
mapa := map[string]string{
        "jedan":"one",
        "dva":"two",
       }
```
Semicolons are auto-inserted by Go compiler.

http://stackoverflow.com/questions/29300607/golang-bug-or-intended-feature-on-map-literals


### Method overloading

Not supported in Go.

http://stackoverflow.com/questions/2032149/optional-parameters


### Naming Conventions

Used camelCase or PascalCase instead of underscores for multiword names.

https://golang.org/doc/effective_go.html


### Global variables and constants
```
//This is how you declare a global variable
var someOption bool

//This is how you declare a global constant
const usageMsg string = "goprog [-someoption] args\n"
```
http://stackoverflow.com/questions/9539633/global-variables-get-command-line-argument-and-print-it


### Lists

```
package main

import (
  "container/list"
  "fmt"
)

func main() {
  // Create a new list and put some numbers in it.
  l := list.New()
  e4 := l.PushBack(4)
  e1 := l.PushFront(1)
  l.InsertBefore(3, e4)
  l.InsertAfter(2, e1)

  // Iterate through list and print its contents.
  for e := l.Front(); e != nil; e = e.Next() {
    fmt.Println(e.Value)
  }

}
```

https://golang.org/pkg/container/list/#example_


### Constructors
```
package matrix
function NewMatrix(rows, cols int) *matrix {
    m := new(matrix)
    m.rows = rows
    m.cols = cols
    m.elems = make([]float, rows*cols)
    return m
}


package main
import "matrix"
wrong := new(matrix.matrix)    // will NOT compile (matrix is private)
right := matrix.NewMatrix(2,3) // ONLY way to instantiate a matrix
```
http://www.golangpatterns.info/object-oriented/constructors


### Composite literal

```
[]Example{
  Example{
   []string{"a", "b", "c"},
  },
}
```

Without the `[]string`, you'll get `missing type in composite literal`.

https://golang.org/doc/effective_go.html#composite_literals

http://stackoverflow.com/questions/19482612/go-golang-array-type-inside-struct-missing-type-composite-literal


### Exported functions

Functions are exported if they begin with a capital letter.

https://tour.golang.org/basics/3


### Implicit pointer referencing

```
# if p is type *T, both are same
filename := p.Title + ".txt"
filename := (*p).Title + ".txt"
```

Ref: https://stackoverflow.com/questions/30786206/are-pointers-dereferenced-by-default-inside-of-methods

### Instantiate struct.

```
type person struct {
    name string
    age  int
}

func main() {

    // This syntax creates a new struct.
    fmt.Println(person{"Bob", 20})

    // You can name the fields when initializing a struct.
    fmt.Println(person{name: "Alice", age: 30})

    // Omitted fields will be zero-valued.
    fmt.Println(person{name: "Fred"})

    // An `&` prefix yields a pointer to the struct.
    fmt.Println(&person{name: "Ann", age: 40})

    // Access struct fields with a dot.
    s := person{name: "Sean", age: 50}
    fmt.Println(s.name)

    // You can also use dots with struct pointers - the
    // pointers are automatically dereferenced.
    sp := &s
    fmt.Println(sp.age)

    // Structs are mutable.
    sp.age = 51
    fmt.Println(sp.age)
}
```
https://gobyexample.com/structs


### GoSublime plugin

* Requires Sublime Text 3.
* https://github.com/DisposaBoy/GoSublime

```
# Activate 9o interactive shell
Cmd + 9
```


### Formatting / Style Guide

* Use `gofmt` to format your code.
* Tabs preferred over spaces.

http://stackoverflow.com/questions/19094704/indentation-in-go-tabs-or-spaces


### Convert int to string
```
import "strconv"
s := strconv.Itoa(-42)
```
https://golang.org/pkg/strconv/


### StringBuilder
Efficient string concatenation in Go:
```
package main

import (
    "bytes"
    "fmt"
)

func main() {
    var buffer bytes.Buffer

    for i := 0; i < 1000; i++ {
        buffer.WriteString("a")
    }

    fmt.Println(buffer.String())
}
```
http://stackoverflow.com/questions/1760757/how-to-efficiently-concatenate-strings-in-go


### Default toString method
For a `type X`, impl a method `func (x X) String() string` Using `(x *X)` doesn't work.
```
package main

import "fmt"

type bin int

func (b bin) String() string {
        return fmt.Sprintf("%b", b)
}

func main() {
        fmt.Println(bin(42))
}
```
http://stackoverflow.com/questions/13247644/tostring-function-in-go


### Deferred Functions
```
// prints "3210"
func b() {
    for i := 0; i < 4; i++ {
        defer fmt.Print(i)
    }
}
```
https://blog.golang.org/defer-panic-and-recover


### Make an array and return a slice
```
s := make([]byte, 5)
// s == []byte{0, 0, 0, 0, 0}
```


### Null
`nil` is the Go version of null.

http://stackoverflow.com/questions/20240179/nil-detection-in-go


### Install Third-Party Package
```
go get github.com/skelterjohn/go.matrix
```
http://thenewstack.io/understanding-golang-packages/


### Syntax Peculiarities
The belows
```
  var b = [][]int {
    {0,0}
  }
```
fails compilation with
```
# ./test.go:7: syntax error: unexpected semicolon or newline, expecting comma or }
```

The following
```
  var b = [][]int {
    {0,0}  }
```
successfully compiles.


### Colon equal (`:=`)
```
foo := "bar"
# equivalent to
var foo = "bar"

# declaration and initialization
```
http://stackoverflow.com/questions/16521472/assignment-operator-in-go-language


### Multi-dimensional slice
```
   var a = [][]int{ {0,0,3}, {1,}, {2,4}, {3,6,6,4},{4,8}}
   var i, j int

   for  i = 0; i < 5; i++ {
      for j = 0; j < len(a[i]); j++ {
         fmt.Printf("a[%d][%d] = %d\n", i,j, a[i][j] )
      }
   }
```


### Iterate over array / foreach loop
```
  var a [4]int
  for i, val := range a {
    fmt.Printf("%v, %v\n", i, val)
  }

  // http://stackoverflow.com/questions/7782411/is-there-a-foreach-loop-in-go`
  for _, element := range someSlice {
    // element is the element from someSlice for where we are
  }
```


### Hello, world!
```
package main

import "fmt"

func main() {
  fmt.Printf("Hello, world.\n")
}
```
https://golang.org/doc/code.html


### Structs and methods
Go does not have classes. Use structs and methods instead.
```
type Rectangle struct {
  x1, y1, x2, y2 float64
}

// Function return type is float64
// function takes a *receiver*
func (r *Rectangle) area() float64 {
  l := distance(r.x1, r.y1, r.x1, r.y2)
  w := distance(r.x1, r.y1, r.x2, r.y1)
  return l * w
}
```
https://www.golang-book.com/books/intro/9
https://gobyexample.com/methods

You can pass by value or reference:
```
func (r *rect) area() int {
    return r.width * r.height
}

func (r rect) perim() int {
    return 2*r.width + 2*r.height
}
```
Usage within method body treats variable like value. (Everything in Go is pass by value.) Data structure structs usually just contain pointers and a few primitives, so copying is not a big deal. However, if you need modifications to the primitives (e.g.: ints) persisted, then you need to pass a pointer to the struct.


### Default Struct Values

Use a constructor function.

http://stackoverflow.com/questions/37135193/how-to-set-default-values-in-golang-structs


### Default Variable Initialization
Variables declared without initialization are given default "zero" values:
* 0 for int, float, complex
* false for boolean
* "" for string

https://tour.golang.org/basics/12


### Code layout / project structure

```
$ pwd
/Users/ahsu/bitbucket/teamaa/go

$ tree
.
├── bin
│   └── patchwork
└── src
    └── bitbucket.org
        └── teamaa
            └── patchwork
                ├── README.md
                ├── bin
                ├── contributors.txt
                └── patchwork
                    ├── patch.go
                    └── test.go

$ echo $GOPATH
/Users/ahsu/bitbucket/teamaa/go

$ go install bitbucket.org/teamaa/patchwork/patchwork  # can run from any directory
$ bin/hello  # or $GOPATH/bin/hello if not in $GOPATH already

$ cd src/bitbucket.org/teamaa/patchwork/patchwork
$ go install
```

You can set the bin location by setting `$GOBIN`.