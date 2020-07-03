### Give Internet access to remote host

Squid + reverse SSH tunnel

https://unix.stackexchange.com/questions/116191/give-server-access-to-internet-via-client-connecting-by-ssh

```
sudo yum install squid
sudo squid

ssh -R 3129:localhost:3128 my-remote-host

# on remote host
# run the following
# best NOT to set in /etc/environment or else it may cause
# permanent issues
export http_proxy=http://127.0.0.1:3129
export https_proxy=http://127.0.0.1:3129

# run your command that uses the Internet!
```


### Generate 2048-bit RSA private key

https://www.openssl.org/docs/apps/genpkey.html

Encrypted data can be of length 2048 / 8 - 11 = 245 bytes long

http://stackoverflow.com/questions/10007147/getting-a-illegalblocksizeexception-data-must-not-be-longer-than-256-bytes-when

```
openssl genpkey -algorithm RSA -out key.pem -pkeyopt rsa_keygen_bits:2048

# Generate public key in PKCS8 DER format using RSA private key
openssl rsa -in key.pem -inform PEM -pubout -outform DER -out public_key.der

# Generate private key in PKCS8 DER format using RSA private key
openssl pkcs8 -topk8 -in key.pem -inform PEM -nocrypt -out private_key.der -outform DER
```


### Use different krb5.conf file than default /etc/krb5.conf

```
export KRB5_CONFIG=/path/to/conf/file
```


### Export a certificate from Firefox

Click the Lock icon to the left of the URL --> More Information... --> View Certificate --> Details --> Export...


### To add a certificate to your Java cacerts file

http://docs.acl.com/ax/300/index.jsp?topic=/com.acl.ax.admin.help/system_administration/t_importing_certificates_into_the_java_cacerts_file.html

```
keytool -import -alias <alias> -keystore <cacerts_file> -trustcacerts -file <certificate_filename>
# cacerts_file will be located somewhere like /export/apps/jdk/JDK-1_6_0_27/jre/lib/security/cacerts
# Default Java cacerts password is "changeit"
```