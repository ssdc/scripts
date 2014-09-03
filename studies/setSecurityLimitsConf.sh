#!/bin/bash

echo "* soft nofile 256000" >> /etc/security/limits.d/99-palantir.conf
echo "* hard nofile 256000" >> /etc/security/limits.d/99-palantir.conf
echo "* soft nproc 32768" >> /etc/security/limits.d/99-palantir.conf
echo "* hard nproc 32768" >> /etc/security/limits.d/99-palantir.conf
echo "* soft stack 16384" >> /etc/security/limits.d/99-palantir.conf
echo "* hard stack 16384" >> /etc/security/limits.d/99-palantir.conf
echo "# Palantir settings are now stored in /etc/security/limits.d/
    99-palantir.conf" >> /etc/security/limits.conf
