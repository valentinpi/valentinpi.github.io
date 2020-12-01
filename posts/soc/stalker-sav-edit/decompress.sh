#!/usr/bin/bash

get_prefix() {
    echo "$1" | cut -d '.' -f 1
}

get_size() {
    xxd -e -l 4 -s 8 "$1" |\
    cut -b 11-19 |\
    tr '[:lower:]' '[:upper:]'
}

if [ $# -lt 1 ]; then
    echo "Too few arguments" 1>&2
    exit 1
fi

file=$1
prefix=$(get_prefix "$file")
size=$(get_size "$file")
tail -c +13 "$file" > "$prefix.sav_c"
./decompress.py "$prefix.sav_c" "$size"
cp "$prefix.sav_d" "${prefix}_edited.sav_d"
