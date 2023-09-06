#!/bin/bash

# Create CSR (Certificate Signing Request) config file
cat << EOF > kubelet-client.cnf
[req]
distinguished_name = cert_dn
x509_extensions = v3_req
prompt = no

[cert_dn]
CN = system:node:$(hostname)
O = system:nodes

[v3_req]
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = clientAuth
basicConstraints = critical, CA:FALSE
subjectKeyIdentifier = hash
EOF

# Create cert and sign w/ ca cert
openssl req -new -nodes -newkey rsa:2048 -keyout kubelet-client.key -out kubelet-client.csr -config kubelet-client.cnf
sudo openssl x509 -req -in kubelet-client.csr -extensions v3_req -extfile kubelet-client.cnf -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out kubelet-client.crt -days 36500 -sha256
cat kubelet-client.crt kubelet-client.key > kubelet-client-$(date +%Y-%m-%d-%H-%M-%S).pem
