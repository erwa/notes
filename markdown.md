### Lists inside tables.

Use HTML like `<br/>`. E.g.:

```
| Event         | Platform      | Description |
| ------------- |-----------| -----:|
| `message_received`| `facebook-messenger`<br/>`skype`|
```

https://stackoverflow.com/questions/19950648/how-to-write-lists-inside-a-markdown-table


### Tables

```
Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the
raw Markdown line up prettily. You can also use inline Markdown.
```

https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#tables


### Markdown link to section

```
[link text](#abcde)

## <a name='abcde'>Section 1</a>
```

https://stackoverflow.com/questions/2822089/how-to-link-to-part-of-the-same-document-in-markdown


### Markdown emoji cheatsheet

http://www.emoji-cheat-sheet.com/


### Bold/italicize part of a word

```
<b>some</b><i>what</i>
```

http://meta.stackexchange.com/questions/140706/how-do-i-make-part-of-a-word-bold-using-markdown


### Diff code block Markdown

```diff
public class ApplicationMaster {

     if (secureMode) {
       // Set up secret manager for RPC servers
-      ClientToAMTokenIdentifier identifier = new ClientToAMTokenIdentifier(appAttemptID, user);
+      ApplicationAttemptId tmpAttemptId = containerId.getApplicationAttemptId();
+      ClientToAMTokenIdentifier identifier = new ClientToAMTokenIdentifier(tmpAttemptId, user);
       byte[] secret = response.getClientToAMTokenMasterKey().array();
-      ClientToAMTokenSecretManager secretManager = new ClientToAMTokenSecretManager(appAttemptID, secret);
+      ClientToAMTokenSecretManager secretManager = new ClientToAMTokenSecretManager(tmpAttemptId, secret);
       applicationRpcServer.setSecretManager(secretManager);
       metricsServerBuilder.setSecretManager(secretManager);

```

https://github.com/linkedin/TonY/issues/82#issuecomment-504351334


### Strikethrough

```
~~This text will be strikethroughed.~~
```

https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#emphasis


### Set image width in GitHub markdown

Use HTML

```
<img src="https://github.com/favicon.ico" width="48">
```

https://github.com/jgm/pandoc/issues/2554


### Link to file within repo

```
[a relative link](other_file.md)

# however, it seems if you want the text to be the file name, you have to repeat the file name:
[other_file.md](other_file.md)
```

https://stackoverflow.com/questions/7653483/github-relative-link-in-markdown-file


### Link with same text as link

```
[https://www.google.com/]()
```

https://github.github.com/gfm/#example-495