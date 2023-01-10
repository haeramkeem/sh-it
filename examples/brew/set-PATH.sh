#!/bin/bash

$SH_PROFILE_PATH=~/.zshrc

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $SH_PROFILE_PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $SH_PROFILE_PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
