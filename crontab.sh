crontab
--------------------------
you can schedule the scripts periodically. mid night script , weekend script +, hourly scripts


With in Linux prefer to write shell script, because shell is native there
Python --> getting data from external systems

crontab
---------------
You can schedule the scripts periodically. mid night scripts, weekend scripts,hourly scripts

5 4  * 	  * 	*
M H day month   day(week)
*/2 * * * *

/home/ec2-user/git-practice/18-delete-old-logs.sh

backup
---------------
logs-source-dir --> destination-directory(zip them)

dynamically user gives source directory, destination directory, number of days

number of days --> optional, if they dont provide, default is 14 days

get the source dir, destination dir, days from user

if they are not providing, show them usage and exit

if they provide, check those dir are exist,if not exist exit the script
if exist, find the files more than 14 days, zip them and move to destination directory, delete in source directory

/home/ec2-user/app-logs

/home/ec2-user/backup

find . -name "*.log" -mtime +14 | zip <name-of-zip-file> -@

/home/ec2-user/backup/app-logs-<time-stamp>.zip

check HD memory, send email if it crosses more than 75%
----------------------------------------------------

/dev/mapper/RootVG-rootVol   xfs       6.0G  1.8G  4.2G  30% /

read the file and count the number of each word/ print the top 5 occurences
reverse rows into column and columns as rows