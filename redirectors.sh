

#!/bin/bash

LOGS_FOLDER="/var/log/shellscript"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privileges $N" &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is...$R FAILED $N" &>>$LOG_FILE
       exit 1
    else
       echo -e "$2 is... $G SUCCESS $N" &>>$LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh fn.sh package1 package2 ..."
    exit 1
}

echo "Script starting executing at: $(date)" &>>$LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in "$@" # reverse the all arguments passed to it
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
       echo "$package is not installed, going to install it.." &>>$LOG_FILE
       dnf install $package -y &>>$LOG_FILE
       VALIDATE $? "Installing $package"
    else
       echo -e "$package is already $Y installed..nothing to do $N" &>>$LOG_FILE
    fi
done


------------------------------out---------------------

#all packeges and out the packeges storge the practicual file are saved

[ root@ip-192-40-1-155 /var/log/shellscript ]# cat fn-2025-01-29-12-43-32.log
Installed Packages
mysql.x86_64             8.0.36-1.el9_3              @rhel-9-appstream-rhui-rpms
mysql is already  installed..nothing to do 
Installed Packages
nginx.x86_64             2:1.20.1-20.el9             @rhel-9-appstream-rhui-rpms
nginx is already  installed..nothing to do 
Installed Packages
postfix.x86_64            2:3.5.25-1.el9             @rhel-9-appstream-rhui-rpms
postfix is already  installed..nothing to do 
Installed Packages
git.x86_64              2.43.5-2.el9_5               @rhel-9-appstream-rhui-rpms
git is already  installed..nothing to do 

44.204.172.114 | 192.40.1.155 | t3.micro | null
[ root@ip-192-40-1-155 /var/log/shellscript ]# 


----------------------output-----------------------

[ root@ip-192-40-1-155 /var/log/shellscript ]# cat fn-2025-01-29-12-55-22.log
Script starting executing at: Wed Jan 29 12:55:22 UTC 2025
Installed Packages
mysql.x86_64             8.0.36-1.el9_3              @rhel-9-appstream-rhui-rpms
mysql is already  installed..nothing to do 
Installed Packages
nginx.x86_64             2:1.20.1-20.el9             @rhel-9-appstream-rhui-rpms
nginx is already  installed..nothing to do 
Installed Packages
postfix.x86_64            2:3.5.25-1.el9             @rhel-9-appstream-rhui-rpms
postfix is already  installed..nothing to do 
Installed Packages
git.x86_64              2.43.5-2.el9_5               @rhel-9-appstream-rhui-rpms
git is already  installed..nothing to do 

# tee ----->writes logs to mult destinations

--------------------------------------------------------------------------------

#!/bin/bash

LOGS_FOLDER="/var/log/shellscript"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privileges $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is...$R FAILED $N"  | tee -a $LOG_FILE
       exit 1
    else
       echo -e "$2 is... $G SUCCESS $N"  | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh fn.sh package1 package2 ..."
    exit 1
}

echo "Script starting executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in "$@" # reverse the all arguments passed to it
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
       echo "$package is not installed, going to install it.." &>>$LOG_FILE
       dnf install $package -y &>>$LOG_FILE
       VALIDATE $? "Installing $package"
    else
       echo -e "$package is already $Y installed..nothing to do $N" | tee -a $LOG_FILE
    fi
done


------------------------(output)-----------------------------------------------

 sudo sh fn.sh mysql nginx postfix git
Script starting executing at: Wed Jan 29 13:09:40 UTC 2025
mysql is already  installed..nothing to do 
nginx is already  installed..nothing to do 
postfix is already  installed..nothing to do 
git is already  installed..nothing to do 

44.204.172.114 | 192.40.1.155 | t3.micro | null
[ root@ip-192-40-1-155 /home/ec2-user ]# 




------------------------------------------------------------------