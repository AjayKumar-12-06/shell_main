#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "you must have the sudo access to execute this"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "$2 failure"
        exit 1
    else
        echo "$2 success"
    fi

}

for package in #@
do 
    dnf list installed $package
        if [ $? -ne 0 ]; then
            echo "mentioned $package is not available"
            dnf isntall $package -y
                validate $? "$package installing"
        else
            echo "already $package is exists"
        fi
            
