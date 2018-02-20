#!/bin/bash

echo "Installing X related packages"

pacman -S xorg xorg-xinit xorg-server xorg-server-devel xorg-xrandr xorg-xinput xbindkeys mesa dmenu xcompmgr compton i3
