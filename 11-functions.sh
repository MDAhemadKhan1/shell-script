#!/bin/bash

UserId=$(id -u)

Validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 failed....."
        exit 1
    else
        echo "$2 success......"
    fi
}

if [ $UserId -ne 0 ]
then
    echo "you must have root access for this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    Validate $? "Installing Mysql......."
else
    echo "$1 is already exist"
fi        