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


echo "Script starting executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

dnf install mysql-server -y &>>$LOG_FILE
VALIDATE $? "Installing Mysql Server"

systemctl enable mysqld &>>$LOG_FILE
VALIDATE $? "Enabled the Mysql Server"

systemctl start mysqld &>>$LOG_FILE
VALIDATE $? "Staring Mysql Server"

mysql -h mysql.urukundu.live -u root -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE
if [ $? -ne 0 ]
then
  echo "Mysql root password is not setup,setting now"
  mysql_secure_installation --set-root-pass ExpenseApp@1 | tee -a $LOG_FILE
  VALIDATE $? "Setup the root password in Mysql server"
else
   echo "Mysql root password is already setup...$Y SKIPPING $N"
fi
  



