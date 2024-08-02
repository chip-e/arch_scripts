#/usr/bin/bash

echo "!!!THIS SHOULD BE RAN WITH SUDO!!!"
echo "!!! CTRL+c & restart if needed !!!"
sleep 3

# Updates
echo "Updating packages..."
sleep 1
pacman -Syu

# Enabling NetworkManger
systemctl enable NetworkManger
# yay (AUR helper) Installation
echo "yay (AUR) helper set-up"
sleep 1
echo "Downloading and installing yay..."
# Checking for required packages
pacman -S --needed git base-devel
# Cloning into yay git repo
echo "Cloning and downloading yay..."
git clone https://aur.archlinux.org/yay.git
# Goes to makepkg_yay.sh to makepkg without root
source ./makepkg_yay.sh
# put makepkg -si at end of this script if
# the other script doesn't work
#
# Check for other pkgs and download if needed
# alacritty/kitty, polybar
# tmux, mpv/vlc, htop, librewolf
# lxappearance
# keepassxc

#Changes default web browser to Librewolf (xdg-utils)
echo "Changing default web browser to Librewolf..."
sleep 1
#xdg-settings set default-web-browser librewolf.desktop
echo "Done"

#Create + enable 8G swap file for hibernation
echo "Swap file set-up"
sleep 1
echo "Creating swap file (8G)..."
mkswap -U clear --size 8G --file /swapfile
echo "Enabling swap file..."
echo "Done"
swapon /swapfile
echo "Done"
echo "Updating fstab (/etc/fstab)..."
echo "/swapfile none swap defaults 0 0" >>/etc/fstab
echo "Done"

# Reminders for configurations
echo "REMINDER: use nmtui to configure wifi"

# TODO:
# Turn these into menu options 1) 2) 3)...4) ALL OPTIONS
# Clone and set up dot files (i3/xfce)
# Set up vim/nvim config
# Set up files to start i3 from tty automatically
