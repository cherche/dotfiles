#!/bin/bash

PATH="/usr/local/bin:/usr/bin:/bin"

./packages.sh
git add .
git commit -m "[Auto] Updated packages"
git push
