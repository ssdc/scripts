# This script installs the palantir rpm's and puppet modules for the following hosts:
# 
# 1. JBoss BRMS
#
# NOTE: there is a complimentary  script that handles Palantir and Oracle. Please refer to the C4
# installation guides for specific instructions on how to run it.

##################
## BEGIN SCRIPT ##
##################

#!/bin/bash

sudo -i && yum install -y palantir-os-lockdowns palantir-puppet-modules-* && papply

exit
