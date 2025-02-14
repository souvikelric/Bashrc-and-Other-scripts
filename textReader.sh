#!/bin/bash

read -p "Enter the Name and Country separated by space : " name country

echo "$name | $country | Added at $(date | awk '{print $5 $6}')" >> test.txt

#display the current status of the file
clear
cat test.txt | column -t
