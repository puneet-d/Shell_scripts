#!/bin/bash


# Check if disk is mounted on /Data
df -h > mount.txt
if grep "Data" mount.txt
then 
echo "The Disk is already mounted."
else
sudo umount /dev/sda5
sudo mount /dev/sda5 /Data
fi 

# Move all downloaded Items into another folder /Downloads

#mkdir /Downloads/Downloads_$(date +%d%m%Y)
rsync -avrh --progress --remove-source-files ~/Downloads/ /Data/downloads/
rsync -avrh --progress --remove-source-files /Data/downloads/*.iso /Data/ISO/
rsync -avrh --progress "/home/puneet" "/Data/Backup/"

# Run Backup of virtualbox vms

cd /Data/VMBackup
find "/Data/VMBackup/" -name "*.ova" -mtime +1 -exec rm -rf {} \;
todays_date=$(date +%Y%m%d)
vboxmanage list vms | awk '{print $1}' > vmlist.out
input="vmlist.out"
while IFS= read -r line
do
echo "vboxmanage export "$line" -o "$line"_"$(date +%Y%m%d)".ova" | bash
done < "$input"

# Backup on an External Disk

read -p "Do you want to take backup in an external device? :" ans
echo "input is $ans"

if [[ $ans = yes ]]
then 
read -p "Enter the external device where you want to take backup : " extdev
sudo umount $extdev 
read -p "Enter the mount point of External device: " extmountpoint
sudo mount $extdev $extmountpoint
#mkdir "$extmountpoint"/"$HOSTNAME"
rsync -avrh --progress "/Data/Backup/" "$extmountpoint"/"$HOSTNAME"
rsync -avrh --progress "/Data/ISO/" "$extmountpoint"/"$HOSTNAME"


else
echo "Thanks! scripted executed successfully."
fi
