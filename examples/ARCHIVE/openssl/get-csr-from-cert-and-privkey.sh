#!/bin/bash

# Source: https://security.stackexchange.com/a/232028
openssl x509 -x509toreq -in $SITENAME.crt -signkey $SITENAME.key -out $SITENAME-new.csr
