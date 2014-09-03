#!/bin/bash

# this clears the screen, and provides today's date and  details about the system

echo "The following information is provided by mySystems.sh. The script starts now."

echo "Hello, $USER!"
echo

echo "Today's date is `date`, this is week `date +"%V"` of 2013."
echo

echo "These are the users currently connectd to the system:"
w | cut -d " " -f 1 - | grep -v USER | sort -u
echo

echo "This is `uname -s` running on `uname -m` processor."
echo

echo "This is the system uptime:"
uptime
echo

echo "That's it. Have a good day!"
