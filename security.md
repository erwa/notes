### Enable password-less SSH to host

Add public key to `~/.ssh/authorized_keys` file on the host.


# https://www.openssl.org/docs/apps/genpkey.html
# Generate 2048-bit RSA private key
# Encrypted data can be of length 2048 / 8 - 11 = 245 bytes long
# http://stackoverflow.com/questions/10007147/getting-a-illegalblocksizeexception-data-must-not-be-longer-than-256-bytes-when
openssl genpkey -algorithm RSA -out key.pem -pkeyopt rsa_keygen_bits:2048

# Generate public key in PKCS8 DER format using RSA private key
openssl rsa -in key.pem -inform PEM -pubout -outform DER -out public_key.der

# Generate private key in PKCS8 DER format using RSA private key
openssl pkcs8 -topk8 -in key.pem -inform PEM -nocrypt -out private_key.der -outform DER

### Make SSH ignore config file
```
ssh -F /dev/null ...
```
http://unix.stackexchange.com/questions/110283/how-can-i-make-ssh-ignore-ssh-config

### Specify different UserKnownHostsFile when using ssh or scp:
ssh -o UserKnownHostsFile=/path/to/known_hosts <host>
scp -o UserKnownHostsFile=/path/to/known_hosts <file> <host>:

# Set timeout for ssh
ssh -o ConnectTimeout=10  <hostName>

# Disable host key checking
SSH and automatically add host to known_hosts file. See http://askubuntu.com/questions/45679/ssh-connection-problem-with-host-key-verification-failed-error.
```
ssh -o StrictHostKeyChecking=no user@something.example.com <command>
```
Or add following to `~/.ssh/config`:
```
Host *
  StrictHostKeyChecking no
```
See http://linuxcommando.blogspot.com/2008/10/how-to-disable-ssh-host-key-checking.html for details.

# SSH exit code
From ssh man page:
```
ssh exits with the exit status of the remote command or with 255 if an error occurred.
```

# Use different krb5.conf file than default /etc/krb5.conf
export KRB5_CONFIG=/path/to/conf/file

# To export a certificate from Firefox, click the Lock icon to the left of the URL --> More Information... --> View Certificate --> Details --> Export...
# To add a certificate to your Java cacerts file
# http://docs.acl.com/ax/300/index.jsp?topic=/com.acl.ax.admin.help/system_administration/t_importing_certificates_into_the_java_cacerts_file.html
keytool -import -alias <alias> -keystore <cacerts_file> -trustcacerts -file <certificate_filename>
# cacerts_file will be located somewhere like /export/apps/jdk/JDK-1_6_0_27/jre/lib/security/cacerts
# Default Java cacerts password is "changeit"

### Remove an entry from ~/.ssh/known_hosts
```
ssh-keygen -R HOST_NAME
```