#!/usr/bin/env bash

# Link our general system dotfiles
bash './links.sh'

# Install Homebrew if not yet installed
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Homebrew packages from Brewfile
brew bundle

# Install Atom packages from Atomfile
apm install --packages-file Atomfile

# Link supplementary dotfiles associated with Mac apps
bash './apps.sh'
