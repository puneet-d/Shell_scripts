#!/bin/bash

cd /home/puneet/Downloads

for var in $(cat /home/puneet/Desktop/downlinks)
do 
wget -c $var
done
