# This script installs the palantir rpm's and puppet modules for the following hosts:
# 
# 1. Palantir dispatch
# 2. Palantir Search
# 3. Palantir Enterprise Manager
# 4. Oracle
#
# NOTE: there is a complimentary  script that handles JBoss BRMS. Please refer to the C4
# installation guides for specific instructions on how to run it.

##################
## BEGIN SCRIPT ##
##################

#!/bin/bash

sudo -i && yum install -y palantir-os-lockdowns palantir-puppet-modules-* && papply

ARCH_FOLDER=/var/data/europol/cm/puppet/modules/palantir_archives/files &&
    mkdir -p $ARCH_FOLDER &&
    cd $ARCH_FOLDER &&
    wget http://repository/data/palantir_archives.zip &&
    unzip -oq palantir_archives.zip &&
    rm -rf palantir_archives.zip

exit
