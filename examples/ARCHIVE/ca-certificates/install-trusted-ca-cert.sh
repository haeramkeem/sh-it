#!/bin/bash

# Source: https://superuser.com/a/719047
cp $TRUST_CERT.crt /usr/local/shared/ca-certificates/
sudo update-ca-certificates
