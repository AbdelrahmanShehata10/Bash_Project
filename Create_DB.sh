#!/bin/bash
export LC_COLLATE=C
shopt -s extglob
    valid_pattern='^[A-Za-z][A-Za-z0-9_]*$'
checkBDExistence(){
dires=$(ls -F $PWD | grep /)
flag=0
for folder in $dires
do
    if [ "$(ls -d "$folder")" == "Database/" ]
    then 
        flag=1
break;
    else 
        #echo "Database doesn't exist"
        flag=0
    fi
done
if [ $flag -eq 0 ]
then 
mkdir ./Database
echo "Database Created succesfuly"
else 
        echo "Database_Sys exists"
fi
cd ./Database
}

checkBDExistence

select order in "Create Database" "List Databases" "Connect Database" "Drop Database" "exit"
do
########case1##########
case $REPLY in
"1")
while true; do
  read -p "Enter your DB name: " DBname
                if [[ $DBname =~ $valid_pattern ]]; then
                    mkdir -p "./$DBname" && echo "Database created"
                    break
                else
                    echo "Invalid DB name"
                fi
done
;;

########case2############

"2")
ls -F ../Database | grep "/"
;;
"5")
break
;;
*)
echo "Your choice is INVALID" ;; 
esac
#######case1################
done