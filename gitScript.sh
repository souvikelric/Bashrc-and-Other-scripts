#!/bin/bash

#This is a script to create a starter p5Js project

#check if user has passed a new folder/project name

if [ ! -z $1 ];then
    folder_name=$1
else
    echo "Please enter a new project name"
    exit 1
fi



# Store the current directory
curr_dir=$(pwd)

# Define source directory
src_dir="/c/Users/s.s.roy.chowdhury/OneDrive - Accenture/Desktop/p5js/p5js starter/"

# make a new folder
mkdir $folder_name

# Copy the entire folder into the current directory
if [ -d "$src_dir" ]; then
  cp "$src_dir"* "$curr_dir/$folder_name"
  cd "$curr_dir/$folder_name"
  code .
  echo "Starting to serve Index.html"
  live-server
else
  echo "Source directory does not exist: $src_dir"
  exit 1
fi

exit 0

