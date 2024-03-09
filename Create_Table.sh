#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

select order in "Create Table" "List Tables" "Insert" "Select" "Delete from table" "Update row" "Drop Table" "exit"
do
case $REPLY in
"1")
while true; do
  read -p "Enter your Table name Or "\"back\"" to back >>" Tname
if [[ $Tname =~ $valid_pattern ]] && [ $Tname != "back" ]; then
                  touch  "./$Tname.csv" && echo "Table created"
                    break
elif [ $Tname == "back" ]
then 
break
else
echo "Invalid Table name"
fi
done
;;

"2")
ls ./
;;
"3")
break
;;
"4")
break
;;
"5")
break
;;
"6")
break
;;
"7")
break
;;
"8")
break
;;
*)
echo "Your choice is INVALID" ;; 
esac
done
