read "PleaseEnter your Number" NUM
if [ $NUM -gt 0]; then
    echo "Vaild Number $NUM"
else
    echo "Invaild Number"
fi






----------------------------if condition -------------------------------------

#!/bin/bash                                                                       │PleaseEnter your Number:100
 read -p "PleaseEnter your Number:" NUM                                           │Vaild Number 100
if [ $NUM -gt 0 ]; then                                                           │Its a EVEN NUMBER
    echo "Vaild Number $NUM"                                                      │root@ip-10-40-1-38:/home/ubuntu#
   if [ `expr  $NUM % 2` -eq 0 ]                                                  │
   then                                                                           │
   echo "Its a EVEN NUMBER "                                                      │
   fi                                                                             │
                                                                                  │
else                                                                              │
    echo "Invaild Number"                                                         │
fi                                                                                │
                  