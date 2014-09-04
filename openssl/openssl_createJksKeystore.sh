# openssl_createJksKeystore.sh
# ----------------------------
# Author: Scott Stevson, scottstevson@gmail.com
# This script creates a JKS keystore by catenating two files
# (a private key and and signed certificate), creating a PKCS12
# keystore using the opessl library,  and the converting that 
# into JKS format using the java keytool

#!/bin/bash

# set the variable for CA_HOME

export CA_HOME=/Users/sstevson/Code/pki/tls/exampleCa

# The first section performs an if test to determine whether the user
# has passed the script the required files

if [ $# -ne 2 ]
    then
        echo "Usage: command keyfile certificate...." 1>&2
        exit 1
fi

# This section tests whether the OPENSSL_CONF variable is using the "CA" conig

if [ "$OPENSSL_CONF" = "$CA_HOME/configs/openssl_ca.cnf" ]
    then 
        echo "The openssl variable is set correctly"
    else
        echo "The openssl variable isn't set correctly. Run the 'ca' alias." 1>&2
        exit 1
fi

# This section uses the openssl and java keytool libraries to complete the task and save the JKS
# keystore in the CA cert's keystores directory.

echo "Creating the PKCS12 keystore"

cat $1 $2 | openssl pkcs12 -export -out Server_Keystore.pkcs12 -name secureserver

echo "Importing the PKCS12 keystore into a JKS keystore"

# Asking the user what unique name he'd like to use before the import occurs. This value will be prepended to the jks keystore output 

echo "Enter a unique name for the keystore. Example: 'VM1' or 'dispatch'"
read unique

keytool -importkeystore -v -srckeystore Server_Keystore.pkcs12 -srcstoretype pkcs12 -deststoretype jks -destkeystore $CA_HOME/keystores/${unique}_Server_Keystore

echo "Importing the CA cert into the new JKS keystore"

keytool -importcert -v -alias ca -file $CA_HOME/cacert.pem -keystore $CA_HOME/keystores/${unique}_Server_Keystore

# And finally, this command removes the pkcs12 keystore from the working directory since we don't need it.

rm Server_Keystore.pkcs12

echo "Complete!"
