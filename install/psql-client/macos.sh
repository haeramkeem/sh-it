#!/bin/bash

if ! `psql --version &> /dev/null`; then
    brew install libpq
    echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc
fi
