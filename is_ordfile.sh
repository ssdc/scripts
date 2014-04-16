#!/bin/bash

if [ $# -eq 0 ]
    then
        echo "you must supply at least one argument."
        exit 1
fi

if [ -f "$1" ]
    then
        echo "$1 is an ordinary file in the working directory"
    else
        echo "$1 is NOT an ordinary file in the working directory"
fi

if [ -x "$1" ]
then
    echo "$1 is executable"
else
    echo "$1 is NOT executable"
fi

echo "End program"
