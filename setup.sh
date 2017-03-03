#!/bin/bash

pacman -S xorg-server xorg-server-devel xorg-init xorg-utils xorg-server-utils xorg-xrandr xorg-xinput xbindkeys mesa i3 dmenu xcompmgr

useradd -m -s /bin/bash schutzekatze
usermod -a -G wheel,audio,video schutzekatze
cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) ALL\)/\1/' | tee /etc/sudoers >/dev/null

pacman -S wpa_supplicant wpa_actiond
wireless_interface=$(iw dev | grep "Interface" | sed 's/.*Interface \(.*\)/\1/')
systemctl enable netctl-auto@$wireless_interface

wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz && \
tar zxf yaourt.tar.gz && \
cd yaourt && makepkg -sri && cd .. && \
rm -rf yaourt && rm -rf yaourt.tar.gz

yaourt -S google-chrome ttf-google-fonts-git

pacman -S vlc pulseaudio chromium gedit eclipse-cpp geogebra htop iotop libreoffice-fresh jdk8-openjdk openjdk8-doc openjdk8-src \
java-openjfx java-openjfx-doc java-openjfx-src gimp cowsay lolcat fortune-mod netbeans nmap openssh python php sl teamviewer \
transmission-qt tree wine xfce4-terminal shotwell feh php noto-fonts-cjk noto-fonts-emoji

#make symlinks for dotfiles
