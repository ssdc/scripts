# openssl_signCsr.sh 
# ------------------
# Author: Scott Stevson, scottstevson@gmail.com
#
# This script signs a certificate signing request using my CA
# and the configuration located in ~/Code/pki/tls/exampleCa/

#!/bin/bash

# This section tests whether the user has passed a file to the script

if [ $# -eq 0 ]
then
    echo "Usage: Command file..." 1>&2
    exit 1
fi

# This section tests whether the openssl variable is set to use the CA config file

if [ "$OPENSSL_CONF" = "/Users/sstevson/Code/pki/tls/exampleCa/configs/openssl_ca.cnf" ]
    then
        echo "The openssl variable is set correctly."

    else
        echo "The openssl variable isn't set correctly. Run the 'ca' alias." 1>&2
        exit 1
fi

# This section gets the the key and csr file patths from the user,  assigns them to variables,
# and signs the requests. The script finishes by adding the signed certs to the cert directory
# and adds an entry in the index.

openssl ca -in $1 -notext -out $NEW_CERTS/$1_signed.pem

echo "Complete!"
