#!/bin/bash

if ! command -v brew > /dev/null; then
    if [ ! -x /opt/homebrew/bin/brew ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install \
    anyenv \
    bat \
    exa \
    fd \
    fzf \
    ghq \
    go \
    gnupg \
    hexyl \
    jq \
    neovim \
    procs \
    ripgrep \
    starship \
    tmux \
    yq

brew install --cask \
    amethyst \
    dropbox \
    google-chrome \
    karabiner-elements \
    git-credential-manager-core \
    iterm2 \
    visual-studio-code

git config --global ghq.root $HOME/devel/src

