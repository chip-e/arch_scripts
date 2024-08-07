#/usr/bin/env/bash
set -euo pipefail
# Arch post-install configuration script

# TODO:
# Use more functions
# Turn these into menu options 1) 2) 3)...4) ALL OPTIONS
# Clone and set up dot files (i3/xfce)
# Set up vim/nvim config
# Set up files to start i3 from tty automatically
# Allow user to input swap file size / match RAM size (read RAM)
# Implement check for Librewolf existence in librewolf_default()

# Check for root status, exits if not ran as root
root_check(){
    if [ ! "$(id - u)" = 0]; then
        echo "Must run as ROOT!"
        exit 1
}

# Create + enable 8G swap file for hibernation
swapfile_setup(){
    echo "Swap File Set-up"
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
}

# Checking package updates with pacman -Syu
pacman_updates(){
    echo "Updating system..."
    sleep 1
    # add --noconfirm (?)
    pacman -Syu
}

# install yay (aur helper)
yay_install(){
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
    # replace with sudo -u $USER makepkg -si at end of this 
    # script if makepkg_yay.sh doesn't work
}

# Changes default web browser to Librewolf (xdg-utils)
librewolf_default() {
    echo "Changing default web browser to Librewolf..."
    sleep 1
    xdg-settings set default-web-browser librewolf.desktop
    echo "Done"
}

# Check for other pkgs and download if needed
# brightnessctl alsa-utils alsa-plugins pipewire-pulse pavucontrol
# udisks2 feh htop man-db thunar bash-completion
# alacritty/kitty polybar
# tmux mpv/vlc htop librewolf
# lxappearance keepassxc

# Enabling NetworkManger
# Do this after packages are installed
nm_enable() {
    echo "Enabling NetworkManger st start-up"
    systemctl enable NetworkManger
}

# Reminders for configurations
echo "REMINDER: use nmtui to configure wifi"

# exit 0
