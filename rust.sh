#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
if [ ! -f $HOME/.cargo/env ]; then
    echo 'rustup might be failed'
    exit 1
fi

source $HOME/.cargo/env
