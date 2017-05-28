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


### Find process running on port
http://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac
```
sudo netstat -tulpn | grep <port>
```
* `-t` means TCP.
* `-u` means UDP.
* `-l` means show only listening sockets.
* `-p` means show the PID and program using the socket/port.
* `-n` means show numerical addresses instead of symbolic host/port/username.

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


### Netgroup lookup
```
getent netgroup NETGROUP_NAME
```