#!/bin/bash

sudo apt-get install build-essential gnupg

if ! command -v brew > /dev/null; then
    if [ ! -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
        sudo apt install build-essential
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# TODO: share this list with the script for Darwin
brew install \
    anyenv \
    bat \
    exa \
    fd \
    fzf \
    ghq \
    go \
    hexyl \
    jq \
    neovim \
    procs \
    ripgrep \
    starship \
    yq

git config --global ghq.root $HOME/devel/src
