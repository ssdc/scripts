# openssl_validateNewCsr.sh
# -------------------------
# Author: Scott Stevson
# 
# This script validates newly created CRS's

#!/bin/bash

# This section tests for whether a user has passed a file to the script

if [ $# -eq 0 ]
    then
        echo "Usage: Command file.." 1>&2
        exit 1
fi

# This section tests whether the openssl variable is set to use the REQUESTOR config file

if [ "$OPENSSL_CONF" = "/Users/sstevson/Code/pki/tls/exampleCa/configs/openssl_requestor.cnf" ]
    then
        echo "The openssl variable is set correctly."

     else
        echo "The openssl variable isn't set correctly. Run the 'request' alias." 1>&2
        exit 1
fi

openssl req -in $1 -text -noout

cp $1 .

echo "Complete!"
