### Comments

```
# this
# is a multiple
# line comment
```

https://www.tutorialspoint.com/yaml/yaml_comments.htm


### Vertical bar / pipe symbol / `|`

Indicates what follows is a multi-line scalar (ignoring indentation, newlines included).

https://stackoverflow.com/questions/15540635/what-is-the-use-of-the-pipe-symbol-in-yaml/18708156


### Aliases to avoid code duplication

```
aliases:
    # example of an alias that defines just a single piece of data
    - &environ [DAMAGE_ENTITY_EXPLOSION, DAMAGE_FIRE,  DAMAGE_CONTACT, DAMAGE_DROWNING, DAMAGE_FALL, DAMAGE_SUFFOCATION]

    # example of an alias that defines a block of data, using the previously defined alias
    - &environDropNothing
      tool: *environ
      drop: NOTHING
      exclusive: 1 # this means that if this drop occurs - none of the others will, unless they have the same number


otherblocks:
    CREATURE_ZOMBIE:
        - *environDropNothing  # stop mob farming - no environmental drops

        # continue with any other custom drops....
```

https://github.com/cyklo/Bukkit-OtherBlocks/wiki/Aliases-(advanced-YAML-usage)


### Validator

https://codebeautify.org/yaml-validator