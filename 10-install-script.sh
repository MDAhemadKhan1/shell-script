#!/bin/bash

UserId=$(id -u)

if [ $UserId -ne 0 ]
then 
    echo "ERROR :: you must have user access to run this script"
    exit 1
fi

dnf list installed $1
if [ $? -ne 0 ]
then
    dnf install $1 -y
    if [ $? -ne 0 ]
    then
        echo "$1 Installation is ...........failed"
        exit 1
    else
        echo "$1 is ...........Success"
    fi    
else
    echo "$1 already exist"
fi


