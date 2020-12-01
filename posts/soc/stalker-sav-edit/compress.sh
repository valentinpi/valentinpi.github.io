#!/usr/bin/bash

if [ $# -lt 1 ]; then
    echo "Too few arguments" 1>&2
    exit 1
fi

# Appending the header is hard to do in a Shell script,
# so we did the processing work in the Python script
file=$1
./compress.py "$file"
