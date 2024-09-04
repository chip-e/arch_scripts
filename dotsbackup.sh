#!/usr/bin/bash
set -euo pipefail
# script for backing up specific config files

# set directory/folder name with current date
currentdate=$(date +"%Y-%m-%d")
backupdir=$HOME/"dots-backup-$currentdate"
pkglistname="pkglist-$currentdate"

# creates back-up directory
mkdir $backupdir

# array for folders to back up
folder_names=(alacritty bgs i3 mpv picom polybar rofi zathura)
file_names=(.vimrc .tmux.conf .bashrc)

# for loop to copy folders to back-up directory
echo "Copying folders from ~/.config/"
for i in ${folder_names[@]} 
do 
    cp -r $HOME/.config/$i $backupdir
    echo "$i copied"
done

# copying vim, tmux, and bashrc
echo "Copying config files from home directory"
for j in ${file_names[@]} 
do 
    cp $HOME/$j $backupdir
    echo "$j copied"
done

# creates list of installed packages
pacman -Qqe >> $backupdir/"$pkglistname".txt
echo "$pkglistname.txt created."

echo "Config files backed up in $backupdir"
