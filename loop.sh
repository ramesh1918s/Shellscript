#!/bin/bash

# -basic loop statement---
# for(int=0,i<=100,i++){
# print i;
# }

# -----------------------

# for i in {0....100}
# do
#   echo $i 
# done


# for i in {0..100}
# do
#   echo $i
# done




# --------------------------------

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root priveleges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 - ne 0 ]
    then
       echo -e "$2 is...$R FAILED $N"
       exit 1

    else
       echo -e "$2 is... $G SUCCESS $N"

    fi
}


CHECK_ROOT
 for package in $@ #refese the all arugements passed to it
 do
    dnf installed $package
    if [ $? -ne 0 ]
    then
       echo "$packege is not installed, going to install it.."
       dnf install $package -y
       VALIDATE $? "Installing $package"
    else
       echo "$package is already installed..nothing to do"
    fi
 done


 -------------------------sh fh.sh mysql nginx git --------------------------
 # install all packeges like mysql nginx git 