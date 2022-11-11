#!/bin/bash

brew update
brew install kube-ps1

cat << EOF >> ~/.zshrc
# Kube-ps1
source "\$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh"
PS1='\$(kube_ps1)'\$PS1
KUBE_PS1_PREFIX="\n("
KUBE_PS1_SYMBOL_COLOR="gray"
KUBE_PS1_CTX_COLOR="green"
EOF

# @see https://github.com/jonmosco/kube-ps1/issues/80
echo "If you got error msg saying: '... /kube-ps1/share/kube-ps1.sh:27: character not in range', then add:"
echo
echo 'export LC_ALL=en_US.UTF-8'
echo 'export LANG=en_US.UTF-8'
echo
echo "to your '~/.zshrc'"
