#!/bin/bash

UserId=$(id -u)

if [ $UserId -ne 0 ]
then 
    echo "ERROR :: you must have user access to run this script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Installation is ...........failed"
        exit 1
    else
        echo "Installation is ...........Success"
    fi    
else
    echo "already exist"
fi


