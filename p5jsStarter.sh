#!/bin/bash

function p5js() {
    echo "Please enter a folder name for the new project:"
    read projName

    if [ -z "$projName" ]; then
        echo "Folder name cannot be empty. Please try again."
        return 1
    fi

    git clone https://github.com/souvikelric/p5JsStarter-Files.git
    mv p5JsStarter-Files $projName
    sleep 2
    cd "$projName" || {
            echo "Failed to enter the folder. Please check permissions."
            return 1
        }
    echo "Created a folder called $projName and navigated into it."
        
    echo "$(ls | wc -l) files have been created"
    code . # Open the folder in Visual Studio Code
}

p5js
