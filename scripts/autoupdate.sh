#!/usr/bin/env bash

PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin"

./scripts/packages.sh
git add Brewfile npmfile inkscape spicetify
git commit -m ".."
git push
