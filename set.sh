#!/bash/bin

# echo "Hello world........."

# echooooo " hello ram....."
# echo "Hello world after failure"

# -----------------(output)--------------------

#  sh set.sh
# Hello world.........
# set.sh: line 5: echooooo: command not found
# Hello world after failure

# -----------------------------------------------
# set -ex # setting the automatic exit, if we get error (x is fot debug) 
# echo "Hello world........."
# echooooo " hello ram....."
# echo "Hello world after failure"

# ------------(output)----------------------

# sh set.sh
# + echo 'Hello world.........'
# Hello world.........
# + echooooo ' hello ram.....'
# set.sh: line 18: echooooo: command not found


# --------------------(trap command)-----------------

set -e

failure(){
     echo "Failured at :$1:$2"
       
}
trap 'failure "${LINENO}" "$BASH_COMMAND" ' ERR # ERR error signal

echo "Hello Shellscript...trap_command"
echooooo"Hello Failure Command...."
echo "Hello world..."


------------------------(output)---------------------------------------

sh set.sh
Hello Shellscript...trap_command
set.sh: line 41: echoooooHello Failure Command....: command not found
Failured at :41:echooooo"Hello Failure Command...."

------------------------------------------------------------------
- Deleting old log files by using shellscript
- write script that should delete . log files which are older than 14 days

1 which directory
2 is that directory exists ?
3 find the files
4 delet the files