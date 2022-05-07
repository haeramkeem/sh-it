#!/bin/bash

curl -L https://go.dev/dl/go1.18.1.linux-amd64.tar.gz -o go.tar.gz
tar -xzvf go.tar.gz -C /usr/local

echo "export GOROOT=/usr/local/go" >> ~/.profile
echo "export GOPATH=\$HOME/go" >> ~/.profile
echo "export PATH=\$PATH:\$GOROOT/bin" >> ~/.profile
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.profile

echo "Installation done"
echo "* Post installation: Type 'source ~/.profile' to load the env-variables"
