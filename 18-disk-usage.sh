#!/bin/bash

Disk_Usage=$(df -hT | grep xfs)
Disk_Threshold=5
MSG=""

while read -r line; do
    Usage=$(echo $line | awk -F " " '{print $6f}' | cut -d "%" -f1)
    Partition=$(echo $line | awk -F " " '{print $7f}')
        if [ $Usage -ge $Disk_Threshold ]; then
                MSG+="for partition :: $Partition and Usage is :: $Usage"
        fi

done <<<$Disk_Usage
