#!/bin/bash

#declaring the array
myArray=("file1" "file2" "file3")

# this only prints the first element
echo "$myArray"

# uses a for loop to print all elements
for file in "${myArray[@]}";do
    echo $file
done

# prints an empty line
echo ""
# also works using below ( this outputs all elements in an array in one line )
echo "${myArray[@]}"

#parsing ls output as an array
#by adding an extra pair of brackets around the expression we can now parse this an array
files=($(ls ../../))
echo "${files[@]}"

#there is a problem with this method though
# any file or folder name with a space is considered a separate folder
for file in "${files[@]}";do
    echo "$file"
done

# to improve that
# we can use the mapfile command along with the find command
echo
echo

mapfile -t files < <(find ../../ -maxdepth 1 -printf "%f\n")
for file in "${files[@]}";do
    echo $file
done