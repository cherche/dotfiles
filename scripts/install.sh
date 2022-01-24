#!/usr/bin/env bash

# Link our general system dotfiles
bash './scripts/links.sh'

# Install Homebrew if not yet installed
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Homebrew packages from Brewfile
brew bundle

# Install Atom packages from Atomfile
apm install --packages-file Atomfile

# Install npm packages from npmfile
xargs npm install --global < npmfile
