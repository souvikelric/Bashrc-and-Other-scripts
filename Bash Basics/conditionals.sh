#!/bin/bash

# a simle if condition
#check if number is greater than 50
num=20
if [ $num -gt 50 ];then
    echo "Greater than 50"
else
    echo "Lesser than 50"
fi

#check if greater than 10
if [ $num -gt 10 ];then
    echo "Greater than 10"
else
    echo "Lesser than 10"
fi

#allowed checks are -eq -ne -lt -gt -ge -le -z(null) -n etc
# Other checks include -f (for file) and -d(for directory)
# let's use the above to check how many files we have in a given folder

mapfile -t allFiles < <(find ../ -maxdepth 1 -printf "%f\n")
echo ${allFiles[@]}

files=0
folders=0
for file in "${allFiles[@]}";do
    if [ -f "../$file" ];then
        ((files++))
    elif [ -d "../$file" ];then
        ((folders++))
    fi
done

echo "Files : $files"
echo "Folders : $folders"

#another example
# check if we have a .bashrc config file in the home directory
# if we do source it 
# else echo out "No Congig available"

if [ -f "$HOME/.bashrc" ];then
    source "$HOME/.bashrc"
else
    echo "No config file present"
fi
