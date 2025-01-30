#!/binbash

# ------------------------------(special variables)-------------------------------

# echo "All variables passed to the script: $@"
# echo "Num of variables passed : $#"
# echo "How to find the script name: $0"
# echo "Current workng directory: $PWD"
# echo "Home directory current user: $HOME"
# echo "Process executing id script: $$"
# sleep 100 &
# echo "PID of last background command: $!"
# echo "previous command is success or failure will check the status : $?"


# -----------(output)---------------
#  bash variables.sh ram 110 120
# All variables passed to the script: ram 110 120
# Num of variables passed : 3
# How to find the script name: variables.sh
#  Current workng directory : /Users/muddappagariurukundu/Ramesh/ShellScript
# Home directory current user : /Users/muddappagariurukundu
# Process executing id script : 2410
# PID of last background command : 2411


# -----------------------------------------------------conditions-------------------------------

# if(expression)
# {
#     execute the statements if above expression is  true
# }
# if(expression)
# {
#     execute the statements if above expression is  true
# }
# else
# {
#     execute the statement if above expression false
# }



# -------------------------------------------------if condition--------------------------------------
# if(today == "monday" or "tuesday" or "wed" or "thu" or "fri")
# {
#     print"attend the class"

# }
# else 
# {
#     print"not attend the class"
# }

# --------------------

# if (today != "sat" or "sun"){
#     print "attend the classes"
# }
# else {
#     print"not attend the classes"
# }

# --normal syntaxs ---------
# NUM=$1

# if [ $NUM -gt 200 ] # -gt (greater then), -lt (less then), ne (not equal to ), -ge (greater then eqaul to) , -le (less then equal to) 
# then 
#     echo "given num is :$NUM greater then 200"
# else 
#     echo "given num is :$NUM less then 200"

# fi


# --------------(output)------------------------

# bash variables.sh 122
# given num is :122 less then 200
# muddappagariurukundu@Abhinavs-iMac ShellScript % bash variables.sh 300
# given num is :300 greater then 200

# # ---------------------------------------------

# USERID=$(id -u)

# if [ $USERID -ne 0 ]
# then
#    echo"Please run this script with root privelages"
#    exit 1

# fi

# dnf list installed git

# if [ $? -ne 0 ]
# then 
#    echo"git is not installed, go to instakk it ..."
#    dnf install git -y
# else
#     echo"git is already installed, nothing to do .."
# fi

# ----------------------------------colour linux --------------------
colours
- 31m _Red
- 32m _Green
- 33m _Yellow
echo -e "\e[31m Hello word "


