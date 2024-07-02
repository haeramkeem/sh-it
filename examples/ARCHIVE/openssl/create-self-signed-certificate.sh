#!/bin/bash

# Create CSR (Certificate Signing Request) config file
cat << EOF > tls.csr.conf
[req]
distinguished_name = cert_dn
x509_extensions = v3_req
prompt = no

[cert_dn]
C = ${COUNTRY:=US}
ST = ${STATE:=Utah}
L = ${LOCALITY:=Lehi}
O = ${ORGANIZATION:=Digicert, Inc.}
OU = ${ORGANIZATION_UNIT:=Marketing}
CN = ${COMMON_NAME:=www.digicert.com}

[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.0 = ${DOMAIN:=*.digicert.com}
IP.0 = ${IP_ADDR:=45.60.125.229}
EOF

# Create keypair and certificate
openssl req -x509 -new -nodes -newkey rsa:2048 -keyout ca.key -out ca.crt -config ca.cnf -days 365000 -set_serial 0
