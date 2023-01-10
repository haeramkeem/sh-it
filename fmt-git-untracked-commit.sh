#!/bin/bash

# CHMOD all
for f in $(find . -name '*.sh'); do
    chmod +x $f
done

# COMMIT all
for f in $(git ls-files -o --exclude-standard); do
    git add $f
    FNAME=$(rev <<< $f | cut -d '/' -f 1 | rev)
    FPATH="root/$(sed "s/$FNAME//g" <<< $f)"
    MSG=$(sed 's/.sh//g' <<< $FNAME | sed 's/-/ /g')
    git commit -m "${FPATH%/}: $MSG"
done
