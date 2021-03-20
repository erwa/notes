### Customize / remove Share This

wp-admin -> Dashboard -> Settings -> Sharing

https://wordpress.org/support/topic/remove-share-this-2/


### Disable hyphenation for words across lines

With a Premium plan, you can edit CSS; otherwise this hack works:

```
<div style="word-wrap:normal;-webkit-hyphens:none;-moz-hyphens:none;hyphens:none;">

COMPLETE CONTENT HERE

</div>
```

https://wordpress.com/forums/topic/how-to-make-words-wrap-not-hyphenate/


### HTML markup allowed in comments

```
<a></a>
<abbr>ABBREVIATION</abbr> # can use to define the expanded abbreviation on hover
<acronym></acronym>
<blockquote></blockquote>
<code></code>
<strike></strike>
<strong></strong>
<b></b>
<em></em>
<i></i>
```

https://en.forums.wordpress.com/topic/html-markup-in-comments