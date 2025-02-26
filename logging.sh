#!/bin/bash

function getAndAddLog(){
    if [ "$1" == "-l" ];then

        echo "Logging Mode"
         if [ -f ~/.log.txt ];then
            # echo "File already exists"
            lineNum=$(wc -l < ~/.log.txt)
            (( lineNum ++ ))
            echo "log$lineNum created at $(date +"%D %I:%M %p")" >> ~/.log.txt
        else
            touch ~/.log.txt
            echo "File Created "
        fi

    elif [ "$1" == "-v" ];then

        cat ~/.log.txt

    elif [ "$1" == "-c" ];then

        > ~/.log.
        echo "Cleared the log successfully"

    fi
}

getAndAddLog $1