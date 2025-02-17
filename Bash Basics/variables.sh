#!/bin/bash

# declare a variable of string and number type
myString="This is a string"
myNumber=42

# print out the values of the 2 variables
echo $myString
echo $myNumber

#concatenating with other strings
mySecondString="This is the next one"
echo "$myString $mySecondString"

# integer operations
# By default they esclude decimal numbers 
# and return the Integer portions only
myOtherNumber=98
myResult=$((myNumber + myOtherNumber))
myProduct=$((myNumber * myOtherNumber))

echo $myResult
echo $myProduct

# store command output in variables
# Here I am storing and printing what files are present in the parent
# directory of the Bash-Scripts folder
myOutput=$(ls ../)
echo $myOutput

# now we can use other commands on the variable output 
# like grep for example
# checking if there is a file or folder that contains the word gsap
echo -e "$myOutput" | grep "gsap"

# export variable values so that they can be accessed outside the script as well
export myOutput

# after exporting the variable to access the exported variable
# you need to source the script rather than just execute the script
# you can also source it in another script