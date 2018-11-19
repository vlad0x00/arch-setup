#!/bin/bash

echo "Installing user packages"

pacman -S qt5-base qt4 vlc pulseaudio gedit gtop htop iotop jdk10-openjdk openjdk10-doc openjdk10-src \
java-openjfx java-openjfx-doc java-openjfx-src gimp cowsay lolcat fortune-mod nmap openssh python python-pip sl keepass \
tree xfce4-terminal shotwell noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra neovim nautilus conky wget \
xfce4-screenshooter xclip base-devel zsh zsh-completions acpi sysstat alsa-utils chromium firefox redshift python-pywal \
xorg xorg-xinit xorg-server xorg-server-devel xorg-xrandr xorg-xinput xbindkeys mesa dmenu compton i3-gaps

echo "Installing AUR packages"

sudo -u $USERNAME yay -S yabar-git ttf-font-awesome-4 oh-my-zsh-git

echo "Changing default shell to zsh"

sudo -u $USERNAME chsh -s /usr/bin/zsh

echo "Installing pip packages"

pip install i3ipc
