#!/usr/bin/bash
set -euo pipefail

# Check & display cache folder size
echo "yay cache size: $(du -hs $HOME/.cache/yay/ | awk {'print $1'})"

# clean package manager cache
yay -Sc

# Check & display cache after cleaning
echo "yay cache size: $(du -hs $HOME/.cache/yay/ | awk {'print $1'})"
