#!/usr/bin/bash
set -euo pipefail
# creates a .txt of explicitly installed pkgs on arch system
# requires 'expac' pkg

currentdate=$(date +"%Y-%m-%d")
filename="pkglist-$currentdate"

# lists explicitly installed pkgs (not in 'base'/'xorg')
expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <({ pacman -Qqg xorg; expac -l '\n' '%E' base; } | sort -u)) | sort -n >> "$filename".txt
