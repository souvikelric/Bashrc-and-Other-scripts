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
ar2=()
for i in {1..5};do
    read -p "Enter a number" var
    ar2+=("$var")
done
echo "${ar2[@]}"