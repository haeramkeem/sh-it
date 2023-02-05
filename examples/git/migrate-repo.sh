#!/bin/bash

# Source: https://hello-bryan.tistory.com/203
git clone --mirror $OLD_REPO_URL
cd $OLD_REPO_NAME.git
git remote set-url --push origin $NEW_REPO_URL
git push --mirror
