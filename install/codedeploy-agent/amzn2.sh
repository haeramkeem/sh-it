#!/bin/bash

# Install dependency
if ! `ruby --version &> /dev/null`; then
    sudo yum update -y
    sudo yum install -y ruby
fi

# Install
curl -LO https://aws-codedeploy-ap-northeast-2.s3.amazonaws.com/latest/install
chmod +x install
sudo ./install auto
rm -rf install

# Register systemd service
sudo systemctl enable --now codedeploy-agent.service
