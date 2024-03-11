#!/bin/bash
export LC_COLLATE=C
shopt -s extglob
declare value
declare Table_F_2_Lines
value=''

get_type() {
    val="$1"

if [[ $val =~ ^[0-9]+$ ]];
then 
        echo "int"
 	else
        echo "string"
fi
}

while true; 
do
	read -p "At Which Table Do You Want To Insert? (enter "\"back\""  to back)" Table_Name
	if [ -f "$Table_Name.csv" ]; 
	then
		Table_Fields=$(head -n 1 "$Table_Name.csv")
		Data_Types=$(head -n 2 "$Table_Name.csv" | tail -n 1)

		read  -a Fields_Array <<< "$Table_Fields"
		read  -a Types_Array <<< "$Data_Types"

		while true; 
		do
			echo "Enter record values OR enter "\"back\""  to back"
			read -r -a record_array

			#----check that there is no pk with same data--- #
			#------storing in pk variable the output of awk command to-------#

			pk=$(awk -F: -v record="${record_array[0]}" 'BEGIN {pk="valid"} {if(record==$1){pk="found";}} END{print pk;}' "$Table_Name.csv")
			#echo "last is $pk"
				if [ "$pk" != "found" ] && [ -n "$record_array" ] && [[ "${#record_array[@]}" -eq "${#Fields_Array[@]}" ]] && [ "${record_array[0]}" != "back" ] #------(-n option check that this value not empty) ------#
					then 
					break
				elif [[ "${#record_array[@]}" -gt "${#Fields_Array[@]}" ]]; then
		    			echo "Error: Number of fields entered is greater than expected"
				elif [ "${record_array[0]}" == "back" ] && [[ "${#record_array[@]}" -eq 1 ]]
					then
					break		
				else 
					echo "please enter your data with unique Primary key"
				fi

		done
if [[ "${#record_array[@]}" -eq "${#Fields_Array[@]}" ]]; then
		for ((i=0;i < ${#record_array[@]};i++));
		 do

			type=$(get_type "${record_array[i]}")
			#echo $type
			#echo $primary_key

			if [[ "${Types_Array[i]}" == $type ]]; 
			then
			    value+="${record_array[i]}:"
			    else
			    echo "Error: Your input does not match the type for field ${Fields_Array[i]}"
			 fi
	        done
		echo "$value" >> "$Table_Name.csv"  #-------echo after the end of for loop not while each iteration--------#
		echo "Record inserted successfully"   
		#pwd
		break
fi
	elif [ $Table_Name == "back" ]
	then
	break
	else
	echo "NO TABLE WITH THIS NAME"
	continue
	fi
done
