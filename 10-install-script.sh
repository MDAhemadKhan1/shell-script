#!/bin/bash

#command to find the user id (id -u)
USERID=$(id -u)

#if the user is root user id will be equal to zero(0)
if [ $USERID -ne 0 ]
then
     echo "ERROR:: user is not the root user"
     exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
     dnf install mysql -y
     if [ $? -ne 0 ]
     then
          echo "installation is....... failure"
     exit 1
     else
          echo "installtion is........ success"
     fi
else
     echo "mysql is already installed"
fi

