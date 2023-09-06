#!/bin/bash

# Source: https://kb.wisc.edu/iam/page.php?id=4543
openssl verify -verbose -CAfile ${CA_CERT_FILE_PATH} ${CERT_PATH_TO_VERIFY}
