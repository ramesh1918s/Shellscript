#!/bash/bin

# - Deleting old log files by using shellscript
# - write script that should delete . log files which are older than 14 days

# 1 which directory
# 2 is that directory exists ?
# 3 find the files
# 4 delet the files
# 5 while  loop ---> read the output or reading the files

# create file with date 

#  - touch -d 20250201 application.java
#    13  01/02/25 11:57:55 touch -d 20250121 index.js
#    14  01/02/25 11:58:38 touch -d 20250126 js.log
#    15  01/02/25 11:59:04 touch -d 2025018 ram.log
#    16  01/02/25 11:59:13 touch -d 20250118 ram.log
#    17  01/02/25 11:59:50 touch -d 20250115 fot.log
#    18  01/02/25 12:00:03 touch -d 20250114 dev.log
#    19  01/02/25 12:00:15 touch -d 20250113 prod.log
# - find . -name "*.log" -mtime +14 (find command we find the files )
# ./mysql.log
# ./fot.log
# ./dev.log
# ./prod.log



SOURCE_DIR=/home/ec2-user/Shellscript/logs
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SOURCE_DIR ]
then
   echo -e "$SOURCE_DIR  $G Exists $N"
else
   echo -e "$SOURCE_DIR $R Does not Exists $N"
   exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14 )
   echo "Files :$FILES"

while IFS= read -r file #IFS , internal feild seperatpor ,empty it will not ignore while space . -r is for not ignore special charaters like (/,@.%.#)
do 
   echo "Deleting file :$file"
   rm -rf $file

done <<< $FILES

# ------------------------(output)--------------------------------


# sh del.sh
# /home/ec2-user/logs   Exists 
# Files :/home/ec2-user/logs/mysql.log
# /home/ec2-user/logs/fot.log
# /home/ec2-user/logs/dev.log
# /home/ec2-user/logs/prod.log
# Deleting line :/home/ec2-user/logs/mysql.log
# Deleting line :/home/ec2-user/logs/fot.log
# Deleting line :/home/ec2-user/logs/dev.log
# Deleting line :/home/ec2-user/logs/prod.log

# 44.201.232.74 | 172.31.81.79 | t2.micro | null
# [ ec2-user@ip-172-31-81-79 ~/logs ]$ ls
# application.java  del.sh  index.js  js.log  ram.log

# --------------------------------------------------------------------