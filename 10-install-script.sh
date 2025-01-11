#!/bin/bash

R=\e[31m
G=\e[32m
N=\e[0m
Y=\e[33m

#command to find the user id (id -u)
USERID=$(id -u)

#if the user is root user id will be equal to zero(0)
if [$USERID -ne 0]
then
    echo "ERROR:: user is not the root user"
    exit 1
 fi

 dnf list installed mysql
 if [$? -ne 0 ]
 then
   dnf install mysql -y
    if [$? -ne 0]
    then 
     echo "installation is.......$R failure $N"
     else 
     echo "installtion is........ $G success $N"
    fi
 else 
     echo "$Y mysql is already installed $N"
fi




 
       