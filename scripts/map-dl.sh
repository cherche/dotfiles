#!/usr/bin/env bash

# This gives us `node`
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin"

cd $HOME/github/map-dl/
node --insecure-http-parser .
