### Errors

```
Error: The function applied to this argument has type
         'weak2 list -> 'weak3 list
```

Add `open Core` to your file.

https://stackoverflow.com/questions/21498575/error-the-function-applied-to-this-argument-has-type-when-using-named-par


### To string

```
(* int to string *)
string_of_int(my_int)
```

https://stackoverflow.com/questions/9986465/ocaml-how-do-i-convert-int-to-string


### Labeled arguments (tilde arg)

```
# let f ~x:x1 ~y:y1 = x1 - y1;;
val f : x:int -> y:int -> int = <fun>
```

http://caml.inria.fr/pub/docs/manual-ocaml/lablexamples.html


### Negative numbers

```
~-  # Integer unary negation
```

https://stackoverflow.com/questions/8984661/unary-minus-and-floating-point-number-in-ocaml


### at sign (@)

Used for list concatenation.

https://medium.com/arena-tech-blog/ocaml-operators-cheatsheet-d9a33bb39072


### ocaml REPL

```
# Show contents of module
#show Core;;

# quit
#quit
```


### Functors

https://dev.realworldocaml.org/functors.html


### Build

Test file `foo.ml` with `open Core`.

Build using `corebuild 'foo.native'`.

`corebuild` is just:

```
ocamlbuild \
    -use-ocamlfind \
    -pkg core \
    -tag "ppx(ppx-jane -as-ppx)" \
    -tag thread \
    -tag debug \
    -tag bin_annot \
    -tag short_paths \
    -cflags "-w A-4-33-40-41-42-43-34-44" \
    -cflags -strict-sequence \
    "$@"
```

https://www.reddit.com/r/ocaml/comments/8e3ftm/cannot_compile_a_program_with_core/
