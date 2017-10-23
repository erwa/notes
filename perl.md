### Capture groups
http://perldoc.perl.org/perlre.html#Capture-groups
```
# Removes whitespace between foo and bar
# \1 and \2 are backreferences to captured groups
's#^(foo)\s+(bar)#\1\2#'
```


### `#` as delimiter in regular expressions
```
q#STRING#
# q function returns a single-quoted string

# above is equivalent to
q{STRING}
```
http://stackoverflow.com/questions/14329355/what-is-the-meaning-of-the-number-sign-in-a-perl-regex-match
http://www.tutorialspoint.com/perl/perl_q.htm


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