#!/bin/bash

#cd /media/puneet/DataDisk/vmbackup
cd "/media/puneet/bkp-vm"
#find "/media/puneet/DataDisk/vmbackup/" -name "*.ova" -mtime +1 -exec rm -rf {} \;
todays_date=$(date +%Y%m%d)
vboxmanage list vms | awk '{print $1}' > vmlist.out
input="vmlist.out"
while IFS= read -r line
do
echo $line
echo "vboxmanage snapshot "$line" take "$line"_"$(date +%Y%m%d)"" | bash
#echo "vboxmanage export "$line" -o "$line"_"$(date +%Y%m%d)".ova" | bash
done < "$input"







