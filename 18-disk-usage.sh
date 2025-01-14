#!/bin/bash

Disk_Usage=$(df -hT | grep xfs)
Disk_Threshold=5
MSG=""

while read -r line; do
    echo "xfs files are $line"
    Usage=$(echo $line | awk -F " " '{print $6f}' | cut -d "%" -f1)
    echo "usage is $Usage"
    Partition=$(echo $line | awk -F " " '{print $7f}')
    echo "partition is $Partition"
    if [ $Usage -gt $Disk_Threshold ]; then
        echo "usage is:: $Usage for :: $Partition"
    fi

done <<<$Disk_Usage
MSG+= "Hiiiii .......this is mail regardig the disk usage.....
Disk usage $Usage for the $Partition"