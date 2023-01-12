#!/bin/bash

# CHMOD all
for f in $(find . -name '*.sh'); do
    chmod +x $f
done

fmt() {
    local p=$1
    local f=$2

    git add $f
    FNAME=$(rev <<< $f | cut -d '/' -f 1 | rev)
    FPATH="$p/$(sed "s/$FNAME//g" <<< $f)"
    MSG=$(sed 's/.sh//g' <<< $FNAME | sed 's/-/ /g')
    git commit -m "${FPATH%/}: $MSG"
}

# COMMIT untracked
for f in $(git ls-files -o --exclude-standard); do
    fmt 'new' $f
done

# COMMIT modified
for f in $(git ls-files -m --exclude-standard); do
    fmt 'changed' $f
done

# COMMIT deleted
for f in $(git ls-files -m --exclude-standard); do
    fmt 'deleted' $f
done
