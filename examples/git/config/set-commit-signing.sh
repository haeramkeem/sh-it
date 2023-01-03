#!/bin/bash

# Source: https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key#telling-git-about-your-ssh-key
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_rsa.pub
