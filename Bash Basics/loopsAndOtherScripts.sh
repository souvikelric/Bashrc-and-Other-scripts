#!/bin/bash
#checking for loops 

#using a for loop to run through a sequence and printing them out
for i in {1..10};do
    echo $i
done

echo

# a more js esque for loop
for((i=0;i<20;i++)){
    echo $((i*2))
}

#declare a initial array , read input from the user and store in array
ar2=()
for i in {1..5};do
    read -p "Enter a number" var
    ar2+=("$var")
done
echo "${ar2[@]}"

# Loop through all files in the current directory
for file in *; do
    echo "File: $file"
done

# Bash script that accepts arguments
# for this we have to pass arguments while executing script
# for example ./loops.sh arg1 arg2

for arg in "$@"; do
    echo "Argument: $arg"
done

#$ ./script.sh foo bar baz
# Output:
# Argument: foo
# Argument: bar
# Argument: baz

# Loop and check if numbers are even
for i in {1..10}; do
    if ((i % 2 == 0)); then
        echo "$i is even"
    else
        echo "$i is odd"
    fi
done

#output
# 1 is odd
# 2 is even
# 3 is odd
# 4 is even
# 5 is odd
# 6 is even
# 7 is odd
# 8 is even
# 9 is odd
# 10 is even

# Simple script to get the number of hidden files in a folder
# putting it in a function for easy calling and passing parameters if needed
function getNumHidden(){
    shown_files=$(ls ./ | wc -l)
    all_files=$(ls -a ./ | wc -l)
    echo $shown_files
    echo $all_files
    diff=$((all_files - shown_files))
    echo "Number of Hidden Files : $diff"
}

# getting first 4 jpg or png files from the current directory
ls -lt | grep -E "\.jpg$|\.png$" | head -4 | cut -d " " -f6-

#simpler command to do the same, no time stamps added
ls -t | grep -E "\.jpg$|\.png$" | head -4

#same but proper time stamps added ( only time , date and file name using awk )
ls -lt | grep -E "\.jpg$|\.png$" | head -4| awk '{print $6 " " $7 " " $8 " " $9}'

