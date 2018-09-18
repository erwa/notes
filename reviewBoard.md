### Specify server

```
rbt post --server <url>
```

https://www.reviewboard.org/docs/rbtools/dev/rbt/commands/post/#rbt-post-review-board-server-options


### General

* If you open issues and still give a "Ship It!", in the published review on RB, "Ship It!" will be replaced by "Fix it, then Ship it!"
* https://www.reviewboard.org/docs/releasenotes/reviewboard/2.0-beta-3/


### Disable guessing of fields

```
rbt post -g no
```

* Since version 0.6
* https://www.reviewboard.org/docs/rbtools/dev/rbt/commands/post/#guessing-behavior


### Set fields from command line when posting

```
rbt post --branch master --bugs-closed FOO-123 --description "Test commit" --testing-done "Ran unit tests." --target-people="jdoe, jsmith" --target-groups my-team --parent master --summary "Fixed FOO-123"
```


### Horizontal Line

Markdown for horizontal line:

```
-----
```


### Blockquote

```
> quote
```


### Specify revision range

```
rbt post <start-commit> <end-commit>
# Can use HEAD for <end-commit>
```