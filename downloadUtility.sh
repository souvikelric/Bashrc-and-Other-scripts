#! /bin/bash

# echo "This is a utility for looking at the download folder and all of its files"

#color variables
cyan="\x1b[38;2;97;243;243m"
yellow="\x1b[38;2;238;227;111m"
reset="\x1b[0m"

while true; do
  read -erp "Please enter the path to your downloads folder: " path
  if [ -d "$path" ]; then
    echo "Folder path set to: $path"
    all_files=$(ls -a $path | wc -l)
    visible_files=$(ls $path | wc -l)
    hidden_files=$((all_files - visible_files))
    folder_count=$(find "$path" -maxdepth 1 -type d ! -path "$path" | wc -l)
    file_count=$(find "$path" -maxdepth 1 -type f | wc -l)

    echo -e "Number of files and folders present in provided folder:  ${yellow}$all_files${reset}"
    echo -e "Number of visible files and folder:  ${yellow}$visible_files${reset}"
    echo -e "Number of hidden files and folder is:  ${yellow}$hidden_files ${reset}"
    echo ""
    echo -e "${cyan}🗒️  Number of files : $file_count${reset}"
    echo -e "${cyan}📁 Number of folder : $folder_count${reset}"
    echo ""
    break
  else
    echo "Invalid folder path. Please try again."
  fi
done




