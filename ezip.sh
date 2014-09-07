#!/bin/bash

if [ $# -eq 0 ]
    then
        echo "Usage: supply a path to the file you want zipped"
        exit 1
fi

set -e

cd "`dirname "$1"`"
FILENAME=`basename "$1"`
zip -er "$FILENAME.zip" "$FILENAME"
