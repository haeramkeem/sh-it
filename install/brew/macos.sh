#!/bin/bash

# Source: https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/haeramkeem/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/haeramkeem/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
