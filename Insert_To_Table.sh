#!/bin/bash
export LC_COLLATE=C
shopt -s extglob
declare value
declare Table_F_2_Lines

read -p "At Which Table Do You Want To Insert? " Table_Name
while true; do
if [ -f "$Table_Name.csv" ]; then

Table_Fields=$(head -n 1 "$Table_Name.csv")
Data_Types=$(head -n 2 "$Table_Name.csv" | tail -n 1)

 read  -a Fields_Array <<< "$Table_Fields"
 read  -a Types_Array <<< "$Data_Types"

# for ((i = 0; i < ${#Fields_Array[@]}; i++)); do
#     Field="${Fields_Array[i]}"
#     Type="${Types_Array[i]}"
#     echo "Field: $Field, Data Type: $Type"
# done
echo "Enter record values "

 read -r -a record_array
if [[ "${#record_array[@]}" -gt "${#Fields_Array[@]}" ]]; then
    echo "Error: Number of fields entered is greater than expected"
fi
get_type() {
    val="$1"

if [[ $val =~ ^[0-9]+$ ]]; then 
        echo "int"
    else
        echo "string"
        fi


}
value=''
for ((i=0;i < ${#record_array[@]};i++)); do
type=$(get_type "${record_array[i]}")
echo $primary_key

if [[ "${Types_Array[i]}" == $type ]]; then
        value+="${record_array[i]}"
        echo "$value" >> "$Table_Name.csv"
        echo "Record inserted successfully"
#         //elmoskla en shakl elgadwal bytl3 kda bs ashta8lt elhmdllah
# #         id name age address 
# # # int string int string 
# # # 1
# # # 1
# # # 1x
# # # 1x3
# # # 1x3d

    else
        echo "Error: Your input does not match the type for field ${Fields_Array[i]}"
    fi
        done
        


pwd
break
else
echo "NO TABLE WITH THIS NAME"
continue
# // ana hna 3ayz low da5l 3alt yedeny forsa tanya 
fi
done
