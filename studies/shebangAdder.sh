#!/bin/bash

# pseudo code that explains what
# the shebangAdder script does

# Steps:
# 1 - read files as stdin
# 2 - create two empty lines at the top of the file
# 3 - add '#!/bin/bash' to the first line in each file
# 4 - save each file
# 5 - exit with code 0 or 1
# 6 - if exit 1, then echo why that's so

[ find . -type f ]
    echo "found file"
