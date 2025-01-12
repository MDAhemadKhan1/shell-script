#!/bin/bash

UserId=$(id -u)

LOG_FOLDER="/var/log/shell-scripting/"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"


validate() {
    if [ $1 -ne 0 ]; then
        echo "$2......failed"
        exit 1
    else
        echo "$2.......success"
    fi
}

if [ $? -ne 0 ]; then
    echo "you must have root access to execute this script"
    exit 1
fi

for software in $@; do
    dnf list installed $software &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]; then
        dnf install $software -y &>>$LOG_FILE_NAME
        validate $? "installing $software"
    else
        echo "$software already exist"
    fi
done
