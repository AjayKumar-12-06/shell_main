#!/bin/bash

USERID=$(id -u)
G="\e[31m"
R="\e[32m"
Y="\e[33m"
N="\e[0m"

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

dnf list installed mysql
    if [ $? -ne 0 ]; then
        echo "checking mysql installed or not"
            dnf install mysql -y
            validate $? "insatlling mysql"
    else
        echo "$Y already installed $N"
    fi