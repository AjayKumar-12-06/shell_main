#!/bin/bash

echo "all the arguments with comma separate" $@
echo "all the arguments wiht single string" $*
echo "NUmber of arguments" $#
echo "current pid" $$

echo "last pid" $!
echo "current user" $USER
echo "present working directory" $PWD
echo "last command status" $?
echo "file name" $0
