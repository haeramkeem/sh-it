#!/bin/bash

# on macos, `-i` option requires backup file suffix
# so, doing `sed -i 's/old/new/g' $FILE` outputs the error saying 'Invalid command code ...'
# if u don't wanna make backup file, do
sed -i '' 's/old/new/g' $FILE
