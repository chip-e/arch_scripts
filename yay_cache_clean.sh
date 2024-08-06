#!/usr/bin/bash
set -euo pipfail

# Check & display cache folder size
echo "cache folder size: $(du -hs $HOME/.cache/yay/)"
sleep 3

# clean package manager cache
yay -Sc

# Check & display cache after cleaning
echo "cache folder size: $(du -hs $HOME/.cache/yay/)"
