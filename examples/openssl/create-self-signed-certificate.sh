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

# Option 1) Create RSA, CSR and CRT separately
## Step 1) Generate RSA:4096 privkey
openssl genrsa -out tls.key 4096
## Step 2) Generate CSR
openssl req -new -key tls.key -out tls.csr -config tls.csr.conf
## Step 3) Generate Cert
openssl x509 -req -in tls.csr -out tls.crt -extensions v3_ext -extfile tls.csr.conf -days ${EXPIRATION_DAYZ}
