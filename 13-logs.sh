#!/bin/bash

UserId=$(id -u)

LOG_FOLDER="/var/log/shell-scripting-logs"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$( date +%Y-%m-%d-%H-%M-%S )
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"



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

 dnf list installed nodejs &>>$LOG_FILE_NAME
 if [ $? -ne 0 ]
then 
    dnf install nodejs -y &>>$LOG_FILE_NAME
    Validate $? "nodejs"
else "already installed"
fi  



 dnf list installed mysql &>>$LOG_FILE_NAME
 if [ $? -ne 0 ]
then 
    dnf install mysql -y &>>$LOG_FILE_NAME
    Validate $? "mysql"
else "already installed"
fi  


