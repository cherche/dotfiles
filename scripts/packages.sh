#!/usr/bin/env bash

# Back up current Brewfile
mv Brewfile Brewfile_OLD
# Generate updated Brewfile
{
  brew bundle dump
  mv Brewfile_OLD ~/.Trash
} || {
  # And if things go horribly wrong, revert
  mv Brewfile_OLD Brewfile
}

mv npmfile npmfile_OLD
{
  npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > npmfile
  mv npmfile_OLD ~/.Trash
} || {
  mv npmfile_OLD npmfile
}

