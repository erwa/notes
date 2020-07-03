### Share and persist SSH connections

In your SSH config file

```
ControlMaster auto

Host xyz
  ControlPath ~/.ssh/%r@%h:%p.connection
  ControlPersist 480m
```

https://www.nccgroup.com/us/about-us/newsroom-and-events/blog/2019/october/bypassing-authentication-on-ssh-bastion-hosts/
https://serverfault.com/questions/216125/how-can-i-create-persistent-ssh-connection-to-stream-commands-over-a-period-of


### Make SSH ignore config file

```
ssh -F /dev/null ...
```

http://unix.stackexchange.com/questions/110283/how-can-i-make-ssh-ignore-ssh-config


### Specify different UserKnownHostsFile when using ssh or scp:

```
ssh -o UserKnownHostsFile=/path/to/known_hosts <host>
scp -o UserKnownHostsFile=/path/to/known_hosts <file> <host>:

# Set timeout for ssh
ssh -o ConnectTimeout=10  <hostName>

# Disable host key checking
# SSH and automatically add host to known_hosts file. See http://askubuntu.com/questions/45679/ssh-connection-problem-with-host-key-verification-failed-error.
ssh -o StrictHostKeyChecking=no user@something.example.com <command>
```

Or add following to `~/.ssh/config`:

```
Host *
  StrictHostKeyChecking no
```

See http://linuxcommando.blogspot.com/2008/10/how-to-disable-ssh-host-key-checking.html for details.


### SSH exit code

From ssh man page:

```
ssh exits with the exit status of the remote command or with 255 if an error occurred.
```


### Remove an entry from `~/.ssh/known_hosts`

```
ssh-keygen -R HOST_NAME
```

https://askubuntu.com/questions/20865/is-it-possible-to-remove-a-particular-host-key-from-sshs-known-hosts-file


### SSH Tunnel

```
# route local port 8000 to port 8000 on remotehost.com
ssh -L 8000:localhost:8000 user@remotehost.com
```

http://blog.trackets.com/2014/05/17/ssh-tunnel-local-and-remote-port-forwarding-explained-with-examples.html


### Add key to ssh-agent

```
ssh-add ~/.ssh/id_rsa
```


### Remove key

```
ssh-add -d ~/.ssh/id_rsa
```


### Remove all keys from ssh-agent

```
ssh-add -D
```

http://stackoverflow.com/questions/25464930/how-to-remove-a-ssh-key


### List keys added to ssh-agent
```
ssh-add -l
# or
ssh-add -L
```
http://unix.stackexchange.com/questions/58969/how-to-list-keys-added-to-ssh-agent-with-ssh-add


### Forward ssh-agent
```
ssh -A ...
```


### Enable password-less SSH to host / passwordless SSH

Add public key to `~/.ssh/authorized_keys` file on the host.

Ensure `$HOME` directory has 750 permissions.