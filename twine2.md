### Using JavaScript

Difficult to do in Harlowe. Should use SugarCube if JavaScript is desired.


### Disable transitions
Add following to Stylesheet:
```
.transition-in[data-t8n^=dissolve] {
  -webkit-animation:appear 0ms step-start;
  animation:appear 0ms step-start
}
```
http://twinery.org/forum/discussion/2561/how-to-suppress-page-to-page-transition-effects-in-twine-2-0-3-harlowe


### Print
```
// Snowman
print("Don't forget the parentheses ()!")
```


### Suppress Newlines
```
<!-- Harlowe 
Use curly braces
-->
{}
```
https://twinery.org/forum/discussion/2258/escaping-line-breaks-and-documentation-qs


### Story Formats

Harlowe (default), Snowman, SugarCube

To change, click the name of your story -> Change Story Format.


### For Loop
```
(for: each _a, ...(range:1,2))[ (print: _a) ]
```
https://twine2.neocities.org/#macro_for

Nested for loops can get very slow. Faster to unroll the loops and use a lot of variables and datamaps.


### Comments
```
<!-- COMMENT -->
```


### Current passage

```
(passage:)'s name
```
https://twinery.org/forum/discussion/5423/hey-folks-trying-to-retrieve-the-name-of-the-current-passage-for-a-macro-in-harlow


### Harlowe Reference

https://twine2.neocities.org


### Map

```
# Map passage
(set: $showMapLink to false)
(link: "Close map")[(set: $showMapLink to true) (go-to: (history:)'s last)]

# Map footer
# Tag: "footer"
# add newlines before this for blank space
(if: $showMapLink)[[[View Map->map]]]

# start passage
(set: $showMapLink to true)
```

https://twinery.org/forum/discussion/4680/implementing-a-map


### Use online

https://twinery.org/2/#!/stories


### Creating Links

```
[[text->URL]]
```

https://twinery.org/wiki/twine2:how_to_create_links


### Collaboration

Cannot collaborate directly. Must Publish to File -> share file with collaborator.

https://twinery.org/wiki/twine2:collaborate_with_someone_else