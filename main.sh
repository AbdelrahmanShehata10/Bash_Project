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
echo "Database Installed succesfuly"

else 
        echo "Database_Sys exists"
fi
cd ./Database
}

manageDB()
{
select order in "Create Database" "List Databases" "Connect Database" "Drop Database" "exit"
do
case $REPLY in
"1")
source ../createDB.sh
;;

"2")
ls -F ../Database | grep "/"
;;
"3")
source ../Connect_DB.sh
;;
"4")
source ../drop_DB.sh
;;
"5")
break
;;
*)
echo "Your choice is INVALID" ;; 
esac
done
}
checkBDExistence
manageDB

