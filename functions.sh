                                 Functions 
======================================================================================================

- Function is a block of code 
- 
#!/bin/bash

hello() {
X1=$1
X2=$2
X3=$3
echo "Welcome to $X1,Today is $X2 of $X3"
}
hello $@




--------

- root@ip-10-40-1-180:~# bash hello.sh Pune 3 Oct
Welcome to Pune,Today is 3 of Oct

-------

root@ip-10-40-1-180:~# bash hello.sh
Running the script on Ubuntu...
Hi
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
12 packages can be upgraded. Run 'apt list --upgradable' to see them.
root@ip-10-40-1-180:~# ll
total 40

-rw-r--r--  1 root root  429 Oct 22 06:05 hello.sh
drwx------  3 root root 4096 Oct 19 06:10 snap
root@ip-10-40-1-180:~# cd /tmp
root@ip-10-40-1-180:/tmp# ls
file1
root@ip-10-40-1-180:/tmp# nano hello.sh
root@ip-10-40-1-180:/tmp# cd ..
root@ip-10-40-1-180:/# nano hello.sh
root@ip-10-40-1-180:/# sudo su -
root@ip-10-40-1-180:~# ls
function.sh.save  hello.sh  snap
root@ip-10-40-1-180:~# nano hello.sh
  GNU nano 7.2                                                hello.sh


--------------------------------------------------------------------------------------------------
#!/bin/bash

hello() {
if [ -f /etc/lsb-release ]
then
VER=$(cat /etc/lsb-release | grep -i DISTRIB_ID | cut -d "=" -f2)
if [ $VER=='Ubuntu' ]
then
echo "Ubuntu"
else
echo "Its a Non-ubuntu System"
fi
else
echo "Seen You are not  Running this on a Ubuntu Machine"
fi
}

create_file(){
OUTPUT=$(hello)
if [ $OUTPUT=='Ubuntu' ]
then
echo "Running the script on Ubuntu..."
apt update -y
echo $(date) >>/tmp/file1
fi
}

create_file



---------------------------------------------------------------------------------------------------------------------

#!/bin/bash

hello() {
if [ -f /etc/llsb-release ]
then
VER=$(cat /etc/lsb-release | grep -i DISTRIB_ID | cut -d "=" -f2)
if [ $VER=='Ubuntu' ]
then
echo "Ubuntu"
else
echo "Its a Non-ubuntu System"
fi
else
echo "Seen You are not  Running this on a Ubuntu Machine"
fi
}

create_file(){
OUTPUT=$(hello)
echo "The Value of OUTPUT is $OUTPUT"
OS='Ubuntu'
if [ "$OUTPUT"=="$OS" ]
then
echo "Running the script on Ubuntu..."
apt update -y
echo $(date) >>/tmp/file1
fi
}

create_file



--------------------------------------------------------------------------------------

root@ip-10-40-1-180:~# bash hello.sh
The Value of OUTPUT is Seen You are not  Running this on a Ubuntu Machine
Running the script on Ubuntu...
Hit:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu noble InRelease
Hit:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu noble-updates InRelease
Hit:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu noble-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu noble-security InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
12 packages can be upgraded. Run 'apt list --upgradable' to see them.


------------------------------------------------------------------------------------------------------------

