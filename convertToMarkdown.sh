#!/bin/bash

find . -name "*.md" -exec sh -c 'mv "$1" "${1%.md}.markdown"' _ {} \;

echo "done, your .md's are now all .markdowns"
