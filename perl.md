### `$&` (dollar ampersand) -- the matched string
http://cslibrary.stanford.edu/108/EssentialPerl.html

### `e` regular expression modifier
Evaluate RHS of expression as code.
* http://stackoverflow.com/questions/6082219/perl-regex-e-eval-modifier-with-s

### `\Q...\E`
Interpret everything between as normal characters, not a regular expression.
* http://www.perlmonks.org/bare/?node_id=468052

### Perl flags
http://perldoc.perl.org/perlrun.html

### Extract string from file
```
VERSION=`perl -ne 'print $& if /version": "\K\d+\.\d+\.\d+/' product-spec.json`
```
https://blogs.oracle.com/ksplice/entry/the_top_10_tricks_of