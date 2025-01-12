#!/bin/bash

UserId=$(id -u)
Validate(){
     if [ $1 -ne 0 ]
    then
       echo "$2.....installation failed"
       exit 1
    else
    echo "$2........installed successfull"
    fi 
}

if [ $UserId -ne 0 ]
then
   echo "you must hvae root access"
   exit 1
 fi

 dnf list installed nodejs
 if [ $? -ne 0 ]
then 
    dnf install nodejs -y
    Validate $? "nodejs"
else "already installed"
fi  



 dnf list installed mysql
 if [ $? -ne 0 ]
then 
    dnf install mysql -y
    Validate $? "mysql"
else "already installed"
fi  


