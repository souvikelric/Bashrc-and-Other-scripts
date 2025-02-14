#!/bin/bash

clear
echo "-----Menu------"
echo "1 ---Show Tasks"
echo "2 ---Add Task--"
echo "3 ---Remove Task"
echo "Choose an Option"
read choice

case $choice in 

	1) echo "First Choice";;
	2) echo "Second Choice";;
	3) echo "Third Choice";;
	*) echo "Exiting"
	   exit 1;;
esac
