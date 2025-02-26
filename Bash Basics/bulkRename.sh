#!/bin/bash

# Let's write a function to get the newest 4 images ( jpg or png ) for now
# And copy / rename them to a destination folder

function bulkMove(){
    #get the number of images that the user wants as a parameter
    num=$1
    src_folder=$2
    dst_folder=$3
    action=$4
   
    # get the number of images from the src_folder passed by the user
    images=$(ls -lt "$src_folder" | grep -E "\.jpg$|\.png$" | head -$num| awk '{print $9}')

    # print all the images ( use echo )
    # copy all the images to a destination folder
    if [ $action == "-c" ];then
        for file in $images;do
            cp $src_folder/$file $dst_folder/$file
        done;
    elif [ $action == "-r" ];then
        counter=1
        for file in $images;do
            ext=$(echo $file | awk -F"." '{print $2}')
            mv $src_folder/$file $dst_folder/"$counter.$ext"
            (( counter++ ))
        done;
    fi
}

bulkMove $1 $2 $3 $4