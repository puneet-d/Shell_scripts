#!/bin/bash

file="/Data/VMBackup/vmlist.out"

for vm in $(cat $file)

do
cd "/Data/VMBackup/" 
vboxmanage import $vm
done
