### AS Request

AS request = Authentication Service request

https://msdn.microsoft.com/en-us/library/bb742516.aspx (Kerberos Explained)


### Authentication vs. Authorization

Kerberos only deals with authentication and defers authorization to services themselves.

http://www.kerberos.org/software/adminkerberos.pdf


### Enable additional debugging in Java

```
-Dsun.security.krb5.debug=true
```


### Set custom cache file

```
kinit -c /path/to/customcachefile
export KRB5CCNAME=FILE:/path/to/customcachefile
```


### Set custom krb5.conf file

```
export KRB5_CONFIG=/path/to/custom/krb5.conf
```

In Java

```
System.setProperty("java.security.krb5.conf", "/path/to/krb5.conf");
```


### Set default ticket lifetime and renew lifetime

```
[libdefaults]
  ticket_lifetime = 1d
  renew_lifetime = 7d
```


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