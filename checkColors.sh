#!/bin/bash
# This is a sample script to check colors as variables
# And also output some useful content on login

greenCol="\033[38;2;91;240;179m"
redCol="\033[38;2;253;84;110m"
reset="\033[0m"

availSpace=$(df -h | tail -1 | awk '{print "Available space : " $5}')
memUsed=$(df -h | tail -1 | awk '{print "Used memory : " $6}')

echo -e "${greenCol}${availSpace}${reset}"
echo -e "${redCol}${memUsed}${reset}"
