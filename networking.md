### See network bandwidth usage

iftop

3 numbers are average bandwidth over past 2, 10, 40 seconds.

https://www.linuxjournal.com/content/sysadmins-toolbox-iftop


### Check host CNAME resolves to

```
host <cname>
```


### Check speed of network interface

```
$ sudo ethtool eth0 | grep Speed
  Speed: 1000Mb/s
```


### Get BGP Loopback IP

```
/sbin/ip addr show lo:bgp1

ifconfig lo:bgp1
```


### SOCKS (Socket Secure)

Internet protocol for exchanging network packets between client and server through a proxy server. Also provides authentication so only authorized users can access a server. Proxy server does the TCP/UDP connections and passes them to client.

If both SOCKS proxy and HTTP proxy present, higher-level settings (HTTP proxy) take precedence and SOCKS proxy settings ignored.

https://en.wikipedia.org/wiki/SOCKS
http://docs.oracle.com/javase/7/docs/technotes/guides/net/proxies.html (section 2.4 SOCKS)


### Check what ports are in use

```
lsof -i -P -n | grep LISTEN
# -i to select Internet addresses
# -P don't convert port numbers to names
# -n don't convert network numbers to host names
```

https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/


### Find process running on port

```
# on Mac
# https://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac
netstat -vanp tcp | grep <port>

# on Linux
sudo netstat -tulpn | grep <port>
```

* `-t` means TCP.
* `-u` means UDP.
* `-l` means show only listening sockets.
* `-p` means show the PID and program using the socket/port.
* `-n` means show numerical addresses instead of symbolic host/port/username.

http://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac

On a Mac, use:

```
lsof -i tcp:22

# alternative
netstat -anp tcp | grep <port>
```

* `-a` means show the state of all sockets, including server process sockets.
* `-n` means show network addresses as IP addresses instead of using domain names.
* `-p tcp` means show stats for the TCP protocol.


### SNAT

Source Network Address Translation. Converts source IP into a public IP.

https://www.juniper.net/techpubs/en_US/contrail2.1/topics/task/configuration/snat-vnc.html

Check if SNAT is enabled:

```
sudo iptables -nvL -t nat
```

Enable SNAT:

```
sudo enable-nat
```


### strace

Monitor network traffic of process

```
# -s specifies maximum string size to print
# Add -s 10000 to print longer strings
strace -f -e trace=network PROCESS ARGUMENTS
```

http://askubuntu.com/questions/11709/how-can-i-capture-network-traffic-of-a-single-process/499850


### Netgroup lookup / print members of netgroup

```
getent netgroup NETGROUP_NAME
```