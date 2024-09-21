#!/bin/bash
for file in *.gif; do
    shortpath="${file##*/}"
    base="${shortpath%.gif}"
    magick convert "$base.gif[0]" "$base.png"
done

