#!/usr/bin/env bash

PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin"

./scripts/packages.sh
git add Brewfile Atomfile npmfile
git commit -m "[Auto] Update package lists"
git push
