#!/bin/bash

sudo apt-get update
sudo apt-get install -y zsh

bash <(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
