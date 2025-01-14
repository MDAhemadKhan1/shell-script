#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "you must have root access to execute this script"
    exit 1
fi

SOURCE_DIR="/var/log/applog"

Files=$(find $SOURCE_DIR -name "*.log" -mtime 14)

if [ -n $Files ]; then

    echo "files are .....$Files"

    while read -r file; do
        echo "files to delete....$file"
        echo "deleting the file....$file"
        rm -rf $file
        echo "deleted the file....$file"

    done <<<$Files
    exit 1
else
    echo "here no files older than 14 days"
fi
