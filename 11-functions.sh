#!/bin/bash

check_root(){
    UserId=$(id -u)

if [ $UserId -ne 0 ]; then
    echo "you must need user root access"
    exit 1
fi
}
validate(){

    dnf list installed $1
if [ $? -ne 0 ]; then
    dnf install $1 -y
    if [ $? -ne 0 ]; then
        echo "failed"
        exit 1

    else
        echo "success"
    fi
else
    echo "already exist"
fi

}
