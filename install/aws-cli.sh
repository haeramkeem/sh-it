#!/bin/bash

# Ref: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws/ awscliv2.zip

echo ""
echo "*** Do 'aws configure' to configure secrets like AWS access key ID and secret access key"
echo "*** see: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html"
echo ""
