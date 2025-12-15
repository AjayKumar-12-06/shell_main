#!/bin/bash

USERID=$(id -u)
G="\e[31m"
R="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/log/output.logs"
logs_file=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date + %y-%m-%d-%H-%M-%S)
log_file_name="$logs_folder/$logs_file-$TIMESTAMP.log"

mkdir -p 

if [ $? -ne 0 ]; then
    echo -e " $R you must have the sudo access to execute this $N"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo -e " $2 $R failure $N"
        exit 1
    else
        echo "$2 $G success $N"
    fi
    
}

echo "code execute with timestamp:" $TIMESTAMP

dnf list installed mysql &>>$log_file_name
    if [ $? -ne 0 ]; then
        echo "checking mysql installed or not"
            dnf install mysql -y &>>$log_file_name
            validate $? "insatlling mysql"
    else
        echo "$Y already installed $N"
    fi