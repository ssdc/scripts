#!/bin/bash

# This script determines useful server statistics and prints them to the console.

echo -e "\nHere's your server information." # inform the user what is happening

# Print stats to the console

echo -e "\nTotal memory is:"
cat /proc/meminfo | grep MemTotal

echo -e "\nTotal number of cores are:"
nproc

echo -e "\nTotal space is:"
df -H

echo -e "\nAvailable space is:"
df -h /opt

echo -e "\n"
