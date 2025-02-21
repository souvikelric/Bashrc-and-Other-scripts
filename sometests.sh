#!/bin/bash

#  checking if ".bashrc" file exists
# if [[ -f ~/.bashrc ]]; then
#     echo ".bashrc exists"
#     # outputting the contents of the file if present
#     # cat ~/.bashrc
#     # checking if an argument was passed to the script especially in the 1st position
#     if [ ! -z $1 ]; then
#         cd $1
#     else
#         echo "No folder argument provided"
#     fi
# fi

    # to check if we are inside a git repo or not
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "$(git branch --show-current)"
    else
        echo "You are not inside a Git repository"
    fi

#getting current date and time
#Formatting options include %H - 24Hour hour %I - 12hour hour %M - Minutes %S - Seconds
#%p - am/pm
currentTimeStamp=$(date +"%I:%M:%S %p")
echo $currentTimeStamp

#Function that calculates the execution time of whatever is passed in the "command" variable
function getExecutionTime(){
    command="mkdir test"
    # Get the start time in milliseconds
    start_time=$(($(date +%s) * 1000 + $(date +%N) / 1000000))

    # Execute the command
    $command >> /dev/null

    # Get the end time in milliseconds
    end_time=$(($(date +%s) * 1000 + $(date +%N) / 1000000))

    # Calculate execution time
    execution_time=$((end_time - start_time))
    echo "Execution Time : $execution_time milliseconds"
}

getExecutionTime

function getTime(){
    echo $(date +"%I:%M:%S %p")
}
#function for getting time in seconds
function getTimeInSeconds(){
    echo $(date +"%s")
}
# does not work in macos but will work on linux systems to get time in bash
function getTimeInNano(){
    echo $(date +%N)
}

function getExecutionTime(){
    if [ -z "$1" ];then
        echo "No command provided as argument"
        return
    fi
    command="$1"
    start_time=$(date +%s)
    eval $command
    end_time=$(date +%s)
    execution_time=$((end_time - start_time))
    echo -e "${command} took ${execution_time} seconds to run"
}

getTime
getTimeInSeconds
#getTimeInNano
getExecutionTime "find ./ -type d -exec basename {} \;"






