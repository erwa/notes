### Run CM.make automatically as part of start-up

```
sml -m sources.cm

# see sml -h for more info
```


### Check equality

```
1 = 1
1 <> 0
```

http://rigaux.org/language-study/syntax-across-languages-per-language/SML.html


### Return unit type

```
()
```

https://stackoverflow.com/questions/19529612/what-does-val-it-unit-mean-in-sml


### Exit REPL in Windows

Ctrl-Z


### SML documentation

http://typesafety.net/cmlib/


### CM compilation manager export filters

```
(* the stuff between `Group` and `is` is what gets publicly exported *)
Group
        structure Table
        signature TABLE
        structure Main
        functor A
        funsig A
is
        main.sml
        a/fct.sml
        a/fsig.sml
        table/sources.cm
        RCS/parser.grm,v
```

https://www.smlnj.org/doc/CM/Old/index.html


### Function composition

```
(f o g) (x) = f(g x)
```

http://homepages.inf.ed.ac.uk/stg/NOTES/node34.html


### Handle errors

```
exception Factorial

fun factorial_driver () =
    let
        val input = read_integer ()
        val result = makestring (checked_factorial input)
    in
        print result
    end
    handle Factorial => print "Out of range.\n"
```


### Option structure

```
datatype 'a option = NONE | SOME of 'a

(* create expression of option type *)
SOME(e)
NONE
```

http://sml-family.org/Basis/option.html


### Run file / run in non-interactive mode / exit after running program

```
sml < foo.sml
```

https://stackoverflow.com/questions/14416571/run-sml-file-but-not-be-left-in-interactive-mode


### Remove item from list

```
fun delete (item, list) = List.filter(fn x => x <> item) list
```

https://stackoverflow.com/questions/18291683/remove-elements-from-a-list-in-ml


### Length of a string

```
size s
```

http://pages.cs.wisc.edu/~fischer/cs538.s08/lectures/Lecture31.pdf


### Length of a list

```
length my_list
```


### Currying / curried functions

```
val twice = fn f => fn x => f(f x);
val addtwo = twice (fn x => x+1);

val rec iter =
  fn 0 => (fn f => fn x => x)
   | n => (fn f => fn x => f (iter (n-1) f x));

val curry = fn f => fn x => fn y => f(x, y);
val uncurry = fn f => fn (x, y) => f x y;

(* assuming x,y values and f,g funtions *)
(curry f) x y	=	f(x, y)
(uncurry g)(x, y)	=	g x y
```

http://homepages.inf.ed.ac.uk/stg/NOTES/node33.html


### Mutually recursive functions / corecursive functions

```
fun even 0 = true
  | even n = odd (n-1)
and odd 0 = false
  | odd n = even (n-1)
```

https://www.cs.cmu.edu/~rwh/introsml/core/recfns.htm


### Logical not

```
not boolean_expr
```

http://rigaux.org/language-study/syntax-across-languages-per-language/SML.html


### Logical and

```
andalso

and (* always evaluates both expressions *)
```

http://rigaux.org/language-study/syntax-across-languages-per-language/SML.html


### Standard library / defaul top-level environment

http://sml-family.org/Basis/top-level-chapter.html


### if then else / if_then_else

```
(* "else" part is required so that expression always returns value *)
if c then b1 else b2
```

https://stackoverflow.com/questions/19849216/why-doesnt-sml-allow-if-then-without-else
http://rigaux.org/language-study/syntax-across-languages-per-language/SML.html


### `let` block / let in end

```
let
	val v = e
  val v2 = e2
in
	...
end
```


### Infix operator declaration

```
(* precedence in 0-9, 0 lowest, 9 highest *)
infix <precedence> <operator>

(* right-associative *)
infixr <precedence> <operator>
```

https://en.wikibooks.org/wiki/Standard_ML_Programming/Expressions#Infix_function_calls


### `op` keyword

Turns an infix operator into a regular operator.

```
op ^;
fn : string * string -> string

op *(4, 2);
8 : int
```

https://www.cs.bham.ac.uk/research/projects/poplog/paradigms_lectures/ml.html


### DICT

http://typesafety.net/cmlib/SigDICT.html

```
type foo = int Dict
```


### Functor

Generates structures. Parameterized module or generic structure.

```
% when using a functor, you pass in the key type
% when you create an 'a dict, you define the value type 'a
functor Dict (structure K : ORDERED) :> DICT where type Key.t=K.t =
struct
   structure Key : ORDERED = K
   type 'a dict = Key.t BinTree.tree
   val empty = BinTree.empty
   val insert = ...insert into a BST using Key.lt and Key.eq...
   val lookup = ...lookup in a BST using Key.lt and Key.eq...
end

structure IntDict = Dict (structure K = IntLT)
structure StringDict = Dict (structure K = StringLT)
```

https://www.cs.cmu.edu/~rwh/introsml/modules/subfun.htm
http://www.cs.cmu.edu/~rwh/isml/examples/parameterization.sml


### Signature ascription

Two kinds:

(1) transparent
(2) opaque

```
(* transparent ascription *)
(* definition is not obscured by ascription *)
(* can still access definition and its methods directly *)
structure strid : sigexp = strexp

(* opaque ascription :> *)
(* can only access structure through signature and signature methods *)
structure strid :> sigexp = strexp
```


### Print

```
(* "a" ^ "b" is string concatenation *)
print("N = " ^ T.toString N ^ "\n")
```

https://stackoverflow.com/questions/36937217/sml-replacing-a-concat-by-printing-the-string-directly


### Mutable cells / reference cells

```
val a = ref 0
val x = !a (* retrieve current contents of cell *)
```

https://www.cs.cmu.edu/~rwh/introsml/core/refs.htm


### Signatures and Structures

```
(* describes structure with some type t
   and two operations *)
signature ORDERED = sig
  type t
  (* if you want to define type *)
  (* type t = int *)
  val lt : t * t -> bool
  val eq : t * t -> bool
end
```

https://www.cs.cmu.edu/~rwh/introsml/modules/sigstruct.htm


### List contains

```
fun member_of (item, list) = List.exists (fn x => x = item) list
```

https://stackoverflow.com/questions/43336460/how-to-check-if-x-value-exists-in-sml-list


### Lists / list data structure

```
a::rest (* `a` is the head of the list *)

rev l  (* returns list with elements in reverse order *)

(* check if any element satisfies predicate *)
exists f l
(* applies f to each element x of the list l, from left to right, until f x evaluates to true; it returns true if such an x exists and false otherwise. *)
```

http://sml-family.org/Basis/list.html


### Datatype replication

```
datatype id = datatype longid
```

https://people.mpi-sws.org/~rossberg/sml.html


### Defining a new type / type definition

Convention is to capitalize constructors.

```
(* Spades, Hearts, etc. are nullary constructors *)
datatype suit = Spades | Hearts | Diamonds | Clubs

(* Empty and Node are constructors *)
datatype 'a tree = Empty | Node of 'a tree * 'a * 'a tree

(* Numeral, Plus, and Times are constructors *)
datatype expr = Numeral of int | Plus of expr * expr | Times of expr * expr
```

https://www.cs.cmu.edu/~rwh/introsml/core/datatypes.htm


### Type constructor

A type with parameters, e.g. `list`:

```
(* `list` is a type constructor *)
(* `nil` and `::` are data constructors *)
datatype 'a list = nil | :: of 'a * 'a list
```


### Type vs. datatype

Type is just giving another name to an existing type

Datatype is used to define new types and constructors.

https://stackoverflow.com/questions/19805544/sml-difference-between-type-and-datatype


### Type variable / apostrophe variable / type scheme

Type scheme is type expression involving one or more unknown type variables.

```
(* list is a built-in type operator used to form compound types *)
type 'a list
```

`'a` is a type variable and can be substituted with any type.

https://www.cs.cmu.edu/~rwh/introsml/core/typeinf.htm
https://cs.fit.edu/~ryan/sml/intro.html
https://stackoverflow.com/questions/20437520/what-is-the-difference-between-a-and-a-in-sml


### Apply function to every element of a list

```
fun foo2 list = map (fn x => foo x b (c, d)) list
```

https://stackoverflow.com/questions/12715464/sml-map-function-on-list-with-a-function-that-takes-more-than-1-argument


### Anonymous function

```
(fn x => fn y => x+y) 2 3

(fn (x,y) => x + y) (2,3) 
```

https://stackoverflow.com/questions/2437019/curried-anonymous-function-in-sml


### No-argument function

```
fun foo (): unit = ()
```


### Function declaration with types

```
fun checkpat (pat: Pat.t): typ * context = ...
```


### Function declaration

```
fun fourthroot (x:real):real = sqrt (sqrt x)
```

https://www.cs.cmu.edu/~rwh/introsml/core/functions.htm


### Rename pattern as / nested as

```
fun findCase l nil = raise Malformed
  | findCase l ((h as ((li, _), _))::r) =
    if Label.equal(l, li)
    then h
    else findCase l r
```


### Pattern matching

For nested pattern matching, use parentheses.

```
(* if expression is just pattern matching booleans *)

case booleanExpr of
  true => expr1
| false => expr2

case x of
  1 => "one"
| _ => "anything else"
```

https://courses.cs.washington.edu/courses/cse341/04wi/lectures/03-ml-functions.html
https://stackoverflow.com/questions/40334583/nested-pattern-matching-sml-stepping-through-an-example-and-very-confused



```
fun factorial (0) = 1
  | factorial (n) = n * factorial (n-1)
```

http://www.matfournier.com/blog/puzzling-out-basic-sml-pattern-matching/


### Comments

```
(* (* can be nested *) still comment here *)
```

https://stackoverflow.com/questions/2029846/line-comments-in-standard-ml