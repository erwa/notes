### SNAT
Source Network Address Translation. Converts source IP into a public IP.

https://www.juniper.net/techpubs/en_US/contrail2.1/topics/task/configuration/snat-vnc.html


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