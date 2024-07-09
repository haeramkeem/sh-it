#!/bin/bash

# Create CSR (Certificate Signing Request) config file
cat << EOF > front-proxy-ca.cnf
[req]
distinguished_name = cert_dn
x509_extensions = v3_req
prompt = no

[cert_dn]
CN = front-proxy-ca

[v3_req]
keyUsage = critical, digitalSignature, keyEncipherment, keyCertSign
basicConstraints = critical, CA:TRUE
subjectKeyIdentifier = hash
subjectAltName = @alt_names

[alt_names]
DNS.0 = front-proxy-ca
EOF

# openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -newkey rsa:2048 -keyout front-proxy-ca.key -out front-proxy-ca.crt -config front-proxy-ca.cnf -days 365000 -set_serial 0
