#!/bin/bash

UserId=$(id -u)

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
    dnf list installed $software
    if [ $? -ne 0 ]; then
        dnf install $software -y
        validate $? "installing $software"
    else
        echo "$software already exist"
    fi
done
