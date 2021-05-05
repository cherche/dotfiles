#!/bin/bash

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

# Back up current Atomfile
mv Atomfile Atomfile_OLD
# Generate updated Atomfile
{
  apm list --installed --bare > Atomfile
  mv Atomfile_OLD ~/.Trash
} || {
  mv Atomfile_OLD Atomfile
}
