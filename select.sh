#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

while true; do
  read -p "Enter your Table name Or "\"back\"" to back >> " tname
                if [[ $tname =~ $valid_pattern ]] &&  [ -f "$tname.csv" ] && [ $tname != "back" ] ; then
select order in "Select All" "Select by column value" "Exit"
do
case $REPLY in
"1")
awk -F: '{

printf "---------------------------------------------------------------------"
printf "\n"
    for (i = 1; i <= NF; i++) {
        printf "%-20s", $i
    }
printf "\n"

}'  ./$tname.csv 


 echo "Selected"
                    break
;;

"2")
#while true;do
#  read -p "From which column you want select?"\"back\"" to back >> " cname
#if [[ "${columns[*]}" =~ "$cname:" ]]
#then 
#break
#else
#echo "Invalid column name"
#fi
#done 
  read -p "From which column you want select?"\"back\"" to back >> " cname
c_field=$(awk -F ':' -v column_value="$cname" 'NR==1 { count =0 ;for (i=1; i<=NF; i++){count++;gsub(/ /, "", $i); if ($i==column_value) { break;} } } END { print count }' "./$tname.csv")
#echo $c_field
awk -F: -v column_field=$c_field 'NR != 2 { gsub(/ /, "", $column_field) ;
printf "---------------------------------------------------------------------";
printf "\n";
print $column_field;
 printf "\n";
printf "---------------------------------------------------------------------";
 printf "\n";
}' "./$tname.csv"
;;
"3")
break
;;
*)
echo "Your choice is INVALID" ;; 
esac
done

elif [ $tname == "back" ]
then 
break
                else
                    echo "Invalid Table name"
                fi
done
