#!/bin/bash

# Source: https://github.com/aoki/homebrew-redis-cli
brew tap aoki/redis-cli
brew update && brew doctor
brew install redis-cli
