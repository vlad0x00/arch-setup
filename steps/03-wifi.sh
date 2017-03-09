#!/bin/bash

echo "Setting up wifi"

pacman -S wpa_supplicant wpa_actiond
systemctl enable netctl-auto@$WIRELESS_INTERFACE
