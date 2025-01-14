#!/bin/bash

Disk_Usage=$(df -hT | grep xfs)
Disk_Threshold=5

while read -r line
do 
  echo "usage is $line"
  Usage=$(echo $line | awk -F " " '{print $6f}' | cut -d "%" -f1 )
  Partition=$(echo $line | awk -F " " '{print $7f}')

  
done <<< $Disk_Usage


