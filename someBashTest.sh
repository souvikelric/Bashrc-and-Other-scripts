#!/bin/bash


#a function to check if params are integers or not

is_Integer(){

	if ! [[ $1 =~ ^-?[0-9]+$ ]];then
		return 1
	else
		return 0
	fi
}


if [ -z $1 ];then
	echo first parameter not provided
elif [ -z $2 ];then
	echo second paramater not provided
else
	for item in "$@";do
		if ! is_Integer "$item";then
			echo $item is not an integer. Please enter a number
			exit 1
		fi
	done
	echo Hello $(($1 + $2)) these are parameters
fi

df -h /C | nl | grep 2 | awk '{print TotalSpace :  B n UsedSpace :  B n FreeSpace :  B}'  | column -t
