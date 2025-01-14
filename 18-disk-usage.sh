#!/bin/bash

Disk_Usage=$(df -hT | grep xfs)
Disk_Threshold=5
MSG=""

while read -r line; do
    Usage=$(echo $line | awk -F " " '{print $6f}' | cut -d "%" -f1)
    Partition=$(echo $line | awk -F " " '{print $7f}')
    echo "partition is :: $Partition and Usage is :: $Usage"
    #     if [ $Usage -ge $Disk_Threshold ]; then
    #         MSG+="Hiiiii .......this is mail regardig the disk usage.....
    # Disk usage $Usage for the $Partition"
    #     fi

done <<<$Disk_Usage
