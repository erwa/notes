### Enable client logging
```
export KRB5_TRACE=/dev/stdout
```


### What are Keytabs and how to create one
http://kb.iu.edu/data/aumh.html

### SSH using Kerberos credentials
```
kinit -kt KEYTAB PRINCIPAL

ssh -K USER@HOST
```