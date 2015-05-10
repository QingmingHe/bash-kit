#!/usr/bin/env bash

## Simple clipboard for Cygwin. Usage:
# xclip /path/to/file    # copy contents of file to clipboard
# xclip -o               # print clipboard contents to stdout
# echo string | xclip    # copy string to clipboard
# xclip "this is string" # copy "this is string" to clipboard
if [[ $1 = "-o" ]]; then
    cat /dev/clipboard
elif [[ -f $1 ]]; then
    cat $1 > /dev/clipboard
elif [[ "$#" -eq 1 ]]; then
    echo $1 > /dev/clipboard
else
    cat - > /dev/clipboard
fi
