#!/bin/bash

UserId=$(id -u)

if [ $UserId -ne 0 ]
then 
    echo "ERROR :: you must have user access to run this script"
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git Installation is ...........failed"
        exit 1
    else
        echo "Git Installation is ...........Success"
    fi    
else
    echo "git already exist"
fi


