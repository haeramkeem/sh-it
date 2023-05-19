#!/bin/bash

cat << EOF | sudo tee -a /etc/modules
${MODULE_NAME}
EOF

sudo systemctl restart kmod && sudo systemctl status kmod
