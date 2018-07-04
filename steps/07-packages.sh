#!/bin/bash

echo "Installing user packages"

pacman -S qt5-base qt4 vlc pulseaudio gedit eclipse-cpp geogebra htop iotop jdk8-openjdk openjdk8-doc openjdk8-src \
java-openjfx java-openjfx-doc java-openjfx-src gimp cowsay lolcat fortune-mod nmap openssh python sl keepass \
transmission-qt tree xfce4-terminal shotwell noto-fonts-cjk noto-fonts-emoji noto-fonts-extra neovim nautilus conky wget \
xfce4-screenshooter xclip base-devel zsh zsh-completions acpi sysstat alsa-utils chromium firefox redshift python-pywal

echo "Installing AUR packages"

sudo -u $USERNAME pacaur -S google-chrome ttf-google-fonts-git i3-gaps-next-git yabar-git ttf-font-awesome-4 oh-my-zsh-git

echo "Changing default shell to zsh"

chsh -s /usr/bin/zsh

echo "Installing pip packages"

pip install i3ipc
