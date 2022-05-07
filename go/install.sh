#!/bin/bash

curl -L https://go.dev/dl/go1.18.1.linux-amd64.tar.gz -o go.tar.gz
tar -xzvf go.tar.gz -C /usr/local

echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
echo "export GOPATH=\$HOME/go" >> ~/.profile
echo "export GOROOT=/usr/local/go" >> ~/.profile
source ~/.profile
