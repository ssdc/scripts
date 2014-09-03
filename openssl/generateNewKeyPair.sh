# generateNewKeyPair.sh
# ---------------------
# Author: Scott Stevson, scottstevson@gmail.com
#
# This script generates a new key pair using the requestor
# configuration located in ~/Code/pki/tls/exampleCa/

#!/bin/bash

# This section tests whether the openssl variable is set to use the CA config file

if [ "$OPENSSL_CONF" = "/Users/sstevson/Code/pki/tls/exampleCa/configs/openssl_requestor.cnf" ]
    then
        echo "The openssl variable is set correctly."

    else
        echo "The openssl variable isn't set correctly. Run the 'request' alias." 1>&2
        exit 1
fi

# This section gets the fully qualified domain name (fdnq) from the user, 
# assigns it a variable, and generates both the key and the certificate signing request.

echo "Enter the fully qualified domain name of the server you'd like to issue a certificate for: "

read fdnq

echo "Ok, I'm creating a private key and CSR for $fdnq."

openssl req -newkey rsa:1024 -keyout ${fdnq}_key.pem -keyform PEM -out ${fdnq}_req.pem -outform PEM

echo "Complete!"

# A really cool addition here would be to set a variable for the location of the directory
# containing the private keys and CSR's. Ideally all subsequent scripts would use the same
# variable to find the keys, csr's, and certs.
