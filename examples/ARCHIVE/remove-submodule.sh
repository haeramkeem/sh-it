#!/bin/bash

git rm $PATH_TO_SUBMODULE

# Do commit right away; All changes has been staged already
git commit -m "$COMMIT_MSG"
