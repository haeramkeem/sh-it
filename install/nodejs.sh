#!/bin/bash

NVM="v0.39.1"
NODE="v16.15.0"

# NVM install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM}/install.sh | bash

# NVM settings
cat <<EOF >> $HOME/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# NodeJS & NPM install
nvm install $NODE

# Confirm
node -v
npm -v
