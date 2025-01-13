#!/bin/bash

USERID=(id -u)

if [ $USERID -ne 0 ]; then
    echo "you must have root access to rxecute this script"
    exit 1
fi

SOURCE_DIR="/home/ec2-user/applogs/"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "files need to delete :: $FILES_TO_DELETE"

while read -r file; do
    echo "deleting file :: $file"
    rm -rf $file
    echo "deleted file :: $file"
done 
