#!/bin/bash


# backup
# ---------------
# logs-source-dir --> destination-directory(zip them)

# dynamically user gives source directory, destination directory, number of days

# number of days --> optional, if they dont provide, default is 14 days

# get the source dir, destination dir, days from user

# if they are not providing, show them usage and exit

# if they provide, check those dir are exist,if not exist exit the script
# if exist, find the files more than 14 days, zip them and move to destination directory, delete in source directory

# /home/ec2-user/app-log

# /home/ec2-user/backup

# -  mkdir -p /home/ec2-user/app-log
# -  mkdir -p /home/ec2-user/backup

# -------------------------------------(output)----------------------------------

# sh backup.sh /home/ec2-user/app-log  /home/ec2-user/backup
# Files are found



SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
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
  exit 1

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

if [ ! -z $FILES ] #true if FILES is empty ! nakes it expression false
then
   echo "Files are found"
   ZIP_FILE="$DEST_DIR/app-log-$TIMESTAMP.zip"
   find ${SOURCE_DIR} -name "*.log" -mtime +14  | zip "$ZIP_FILE" -@
   #Check if zip file is successfully created or not
   if [ -f $ZIP_FILE ]
   then
       echo "Successfully zipped files older than $DAYS"
       #remove the files after zipping
       while IFS= read -r file #IFS , internal feild seperatpor ,empty it will not ignore while space . -r is for not ignore special charaters like (/,@.%.#)
       do 
            echo "Deleting file :$file"
            rm -rf $file
        done <<< $FILES

    else
        echo "Zipping the files is failed"

    fi

else
   echo "No Files older than $DAYS"
fi

#(output)
# sh backup.sh /home/ec2-user/app-log  /home/ec2-user/backup
# Files:
# No Files older than 14


# - ~/app-log ]$ touch -d 20250101 mysal.log # create a file mysql.log cd ../app-log/
#change directory cd ../Shellscript

# --------------(output)------------------------
# ~/Shellscript ]$ sh backup.sh /home/ec2-user/app-log  /home/ec2-user/backup
# Files: /home/ec2-user/app-log/mysal.log
# Files are found

# ------------------------------------------------------------------
# find . -name "*.log" -mtime +14 | zip <name-of-zip-file> -@




# ]$ sudo dnf install zip -y ; find . -name "*.log" -mtime +14 | zip sample.zip  -@
# Last metadata expiration check: 0:00:44 ago on Mon Feb  3 12:06:40 2025.
# Package zip-3.0-35.el9.x86_64 is already installed.
# Dependencies resolved.
# Nothing to do.
# Complete!
#   adding: mysal.log (stored 0%)





