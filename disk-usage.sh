#!/bin/bash

#  df -hT
# Filesystem                   Type      Size  Used Avail Use% Mounted on
# devtmpfs                     devtmpfs  4.0M     0  4.0M   0% /dev
# tmpfs                        tmpfs     1.8G     0  1.8G   0% /dev/shm
# tmpfs                        tmpfs     714M  8.6M  706M   2% /run
# /dev/mapper/RootVG-rootVol   xfs       6.0G  1.8G  4.2G  30% /
# /dev/mapper/RootVG-homeVol   xfs       960M   40M  921M   5% /home
# /dev/mapper/RootVG-varVol    xfs       2.0G  377M  1.6G  19% /var
# /dev/mapper/RootVG-logVol    xfs       2.0G  114M  1.9G   6% /var/log
# /dev/nvme0n1p3               xfs       424M  223M  202M  53% /boot
# /dev/nvme0n1p2               vfat      122M  7.0M  115M   6% /boot/efi
# /dev/mapper/RootVG-varTmpVol xfs       2.0G   47M  1.9G   3% /var/tmp
# /dev/mapper/RootVG-auditVol  xfs       4.4G   64M  4.3G   2% /var/log/audit
# tmpfs                        tmpfs     357M     0  357M   0% /run/user/1001

# 54.83.93.175 | 192.40.2.87 | t3.medium | null
# [ ec2-user@ip-192-40-2-87 ~ ]$ df -hT | grep xfs | awk -F " "  '{print $2}'
# xfs
# xfs
# xfs
# xfs
# xfs
# xfs
# xfs

# 54.83.93.175 | 192.40.2.87 | t3.medium | null
# [ ec2-user@ip-192-40-2-87 ~ ]$ df -hT | grep xfs | awk -F " "  '{print $6}'
# 30%
# 5%
# 19%
# 6%
# 53%
# 3%
# 2%


DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #REAL projects, it is usually  75
while IFS= read -r line #IFS , internal feild seperatpor ,empty it will not ignore while space . -r is for not ignore special charaters like (/,@.%.#)
do 
#    echo $line
   USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1 )
   PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
   if [ $USAGE -ge $DISK_THRESHOLD ]
   then 
     echo "$PARTITION is more then $DISK_THRESHOLD, current value: $USAGE.Please check"

    fi
done <<< $DISK_USAGE