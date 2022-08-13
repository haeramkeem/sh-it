#!/bin/bash

brew tap weaveworks/tap
brew install weaveworks/tap/eksctl

# If u got some error says:
#   Error: Your Command Line Tools are too outdated.
#   Update them from Software Update in System Preferences or run:
#       softwareupdate --all --install --force
#
#   If that doesn't show you any updates, run:
#       sudo rm -rf /Library/Developer/CommandLineTools
#       sudo xcode-select --install
#
# Alternatively, manually download them from:
#   https://developer.apple.com/download/all/.
# You should download the Command Line Tools for Xcode 13.4.
#
# Just follow the steps they recommended to u: update the software or re-installa the CommandLineTools
