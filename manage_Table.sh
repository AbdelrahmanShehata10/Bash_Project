#!/bin/bash
export LC_COLLATE=C
shopt -s extglob
declare -a columns
declare -a type
export primary_key
select order in "Create Table" "List Tables" "Insert" "Select" "Delete from table" "Update row" "Drop Table" "exit"
do
case $REPLY in
"1")
#while true; do
#  read -p "Enter your Table name Or "\"back\"" to back >>" Tname
#  if [[ $Tname =~ $valid_pattern ]] && [ $Tname != "back" ] && [ ! -f "./$Tname.csv" ]; then
#                  touch  "./$Tname.csv" && echo "Table created"
#                  read -p "Enter the number of columns for $Tname: " num_columns
#                  for((i=1;i<=$num_columns;i++)); do

#                  read -p "Enter the name of column $i: " column_name
#            columns+=("$column_name")
#             read -p "Enter the types of column $i: " column_type
#            types+=("$column_type")
#                  done
#                  read -p "Please indicate the primary key: " primary_key

#                  while true; do
#                  if [[ " ${columns[*]} " =~ " $primary_key " ]]; then
#                      echo "Table $Tname created with columns: ${columns[*]} and primary key: $primary_key"
#                      echo " ${columns[*]} ">>"./$Tname.csv"
#                      echo " ${types[*]} ">>"./$Tname.csv"
#                      break 
#                  else
#                      echo "Invalid primary key. Please enter a column name from the list."
#                  fi
#                  done

#  elif [ $Tname == "back" ]
#  then 
#    break
#  else
#    echo "Invalid Table name"
#  fi
#done
source $current_script_path/createtable.sh
;;

"2")
ls ./
;;
"3")
source $current_script_path/Insert_To_Table.sh
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
cd ../
echo $PWD

break
;;
*)
echo "Your choice is INVALID" ;; 
esac
done
