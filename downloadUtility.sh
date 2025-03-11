#! /bin/bash

# echo "This is a utility for looking at the download folder and all of its files"
while true; do
  read -erp "Please enter the path to your downloads folder: " path
  if [ -d "$path" ]; then
    echo "Folder path set to: $path"
    all_files=$(ls -a $path | wc -l)
    visible_files=$(ls $path | wc -l)
    hidden_files=$((all_files - visible_files))
    folder_count=$(find "$path" -maxdepth 1 -type d ! -path "$path" | wc -l)
    file_count=$(find "$path" -maxdepth 1 -type f | wc -l)
    echo "Number of files and folders present in provided folder is $all_files"
    echo "Number of visible files and folder is $visible_files"
    echo "Number of hidden files and folder is $hidden_files"
    echo "🗒️  Number of files : $file_count"
    echo "📁 Number of folder : $folder_count"
    break
  else
    echo "Invalid folder path. Please try again."
  fi
done




