#!/bin/bash

# Create CSR (Certificate Signing Request) config file
cat << EOF > ca.cnf
[req]
distinguished_name = cert_dn
x509_extensions = v3_req
prompt = no

[cert_dn]
CN = kubernetes

[v3_req]
keyUsage = critical, digitalSignature, keyEncipherment, keyCertSign
basicConstraints = critical, CA:TRUE
subjectKeyIdentifier = hash
subjectAltName = @alt_names

[alt_names]
DNS.0 = kubernetes
EOF

# openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -newkey rsa:2048 -keyout ca.key -out ca.crt -config ca.cnf -days 365000 -set_serial 0
