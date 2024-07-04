#!/bin/bash

# -c: Compress
# -z: GZIP
# -v: Verbose
# -f $FILE_PATH: Output file path
tar -czvf $OUTPUT_FILE.tar.gz $DIRECTORY
