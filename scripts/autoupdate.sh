#!/usr/bin/env bash

PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin"

./scripts/packages.sh
git add .
git commit -m "[Auto] Update dotfiles"
git push
