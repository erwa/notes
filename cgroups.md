### See cgroup resource consumption

```
systemd-cgtop
```

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/resource_management_guide/sec-modifying_control_groups


### Show cgroup tree

```
systemd-cgls

# show cgroup tree for one resource (devices in below example)
systemd-cgls devices
```

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/resource_management_guide/sec-default_cgroup_hierarchies


### Execute command in cgroup

```
cgexec -g devices:slice/container /usr/bin/nvidia-smi
```