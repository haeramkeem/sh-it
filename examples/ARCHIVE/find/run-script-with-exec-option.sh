#!/bin/bash

# `"{}"` maybe replaced with file name
# `\;` means end-of-script (maybe?)
find ${DIR} -type f -exec ls -al "{}" \;
