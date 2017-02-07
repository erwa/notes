### Check number of disks
```
sudo fdisk -l
# Disks are usually /dev/sdX (e.g.: /dev/sda)
# Partitions are ususally /dev/sdXN (e.g.: /dev/sda1)
```
http://superuser.com/questions/455909/how-to-get-the-number-of-physical-disks-in-linux


### Check if disk is SSD
```
cat /sys/block/sda/queue/rotational
# 1 = hard disk
# 0 = SSD
```
http://unix.stackexchange.com/questions/65595/how-to-know-if-a-disk-is-an-ssd-or-an-hdd