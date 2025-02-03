#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


USAGE(){
     echo -e "USAGE:: sh backup.sh <source> <destination> <days(optional)>"
}
#check the source and destionation are provided

if [ $# -lt 2 ]
then
  USAGE

fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exits....Please check"
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exits....Please check"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14 )

echo "Files: $FILES"

if [ -z $FILES ] #true if FILES is empty
then
   echo "Files are found"

else
   echo "No Files older than $DAYS"
fi


------------------------------------------------------------------

backup
---------------
logs-source-dir --> destination-directory(zip them)

dynamically user gives source directory, destination directory, number of days

number of days --> optional, if they dont provide, default is 14 days

get the source dir, destination dir, days from user

if they are not providing, show them usage and exit

if they provide, check those dir are exist,if not exist exit the script
if exist, find the files more than 14 days, zip them and move to destination directory, delete in source directory

/home/ec2-user/app-log

/home/ec2-user/backup

-  mkdir -p /home/ec2-user/app-log
-  mkdir -p /home/ec2-user/backup

-------------------------------------(output)----------------------------------

sh backup.sh /home/ec2-user/app-log  /home/ec2-user/backup
Files are found

54.83.93.175 | 192.40.2.87 |
