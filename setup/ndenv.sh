#!/bin/sh

if command -v nodenv > /dev/null; then
    echo "ndenv is already installed" 1>&2
    exit
fi

# Plugins here
# Note that node-build is installed while installing nodenv by anyenv.
