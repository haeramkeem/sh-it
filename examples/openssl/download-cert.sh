#!/bin/bash

openssl s_client -showcerts -connect $REG_IP:$REG_PORT </dev/null 2>/dev/null \
    | openssl x509 -outform PEM > $PATH_TO_CRT.crt
