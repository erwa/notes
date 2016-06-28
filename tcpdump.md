tcpdump.md

https://danielmiessler.com/study/tcpdump/

### Filter traffic on port from all interfaces
```
# -i = interface
sudo tcpdump -i any port 88
```

### Filter traffic on UDP
```
sudo tcpdump -i any port 88 and udp
```