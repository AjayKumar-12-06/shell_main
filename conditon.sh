#!/bin/bash

#installing mysql package

#i have to check the user have the sudo access or not
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must have the sudo access to execute this"
    exit 1
fi

dnf list installed mysql
    if [ $? -ne 0 ]; then
        echo "checking the mysql installed or not, if not please install the mysql package"
        dnf install mysql -y
        if [ $? -ne 0 ]; then
            echo "mysql installed failure"
            exit 1
        else
            echo "mysql inatlled success"
        fi
    else
        echo "mysql is already installed"
    fi