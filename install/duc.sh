#!/bin/bash

# @see https://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client-on-ubuntu/
BEFORE=$(pwd)

sudo cd /usr/local/src
sudo curl -L http://www.noip.com/client/linux/noip-duc-linux.tar.gz -o duc.tar.gz
sudo tar -xzvf duc.tar.gz
sudo cd noip-2.1.9-1
sudo make install

# @see https://gist.github.com/NathanGiesbrecht/da6560f21e55178bcea7fdd9ca2e39b5
sudo curl -L https://gist.githubusercontent.com/NathanGiesbrecht/da6560f21e55178bcea7fdd9ca2e39b5/raw/b5594a39e908548f4319294553497d2db3053e0a/noip2.service -o /etc/systemd/system/noip2.service
sudo systemctl daemon-reload
sudo systemctl enable --now noip2.service
