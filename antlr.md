### Reference Manual

http://www4.di.uminho.pt/~gepl/GQE/documents/books/Pragmatic.The.Definitive.ANTLR.4.Reference.Jan.2013.pdf

http://www.antlr3.org/share/1084743321127/ANTLR_Reference_Manual.pdf


### Optional
```
(...)?
```


### Semantic Predicate
```
{ /* boolean expression */ }?
```
http://stackoverflow.com/questions/3056441/what-is-a-semantic-predicate-in-antlr


### Caret Prefix
```
# -> starts a "rewrite rule"
# first token inside ^() becomes root of AST
p : A B C -> ^(B A C);

# produces same AST as

p : A B^ C;

# AST looks like

  B
 / \
A   C
```
http://stackoverflow.com/questions/11365781/caret-prefix-instead-of-postfix-in-antlr