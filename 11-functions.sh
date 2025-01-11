#!/bin/bash

UserId=$(id -u)

Validate(){
    if [ $1 -ne 0 ]
    then
        echo "......failed to install $2....."
        exit 1
    else
        echo "......$2 installed successfully......"
    fi
}

if [ $UserId -ne 0 ]
then
    echo "you must have root access for this script"
    exit 1
fi

dnf list installed mysql

if [ $1 -ne 0]
then
    dnf install mysql -y
    Validate $? "Installing Mysql......."
else
    echo "mysql is already exist"
fi        