#!/bin/bash

# This script determines useful server statistics and prints them to the console.

echo "Gathering server information. Please stand by" # inform the user what is happening

# Gather stats and store them in variables which will be printed to the console

echo "Determining total memory..."

TOTAL_MEM=$(cat /proc/meminfo)

echo "Determining total number of server cores..."

NUMBER_CORES=$(nproc)

echo "Determining total space on the /opt partion..."

TOTAL_SPACE=$(df -H)

echo "Determining available space on the /opt partion..."

AVAIL_SPACE=$(df -h /opt)

# Print stats to the console

echo "Your total memory in kilobytes is"
echo $TOTAL_MEM

echo "Your total number of cores are"
echo $NUMBER_CORES

echo "Your total space is"
echo $TOTAL_SPACE

echo "Your available space is"
echo $AVAIL_SPACE
