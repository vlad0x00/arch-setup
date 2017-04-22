#!/bin/bash

echo "Setting up wifi"

pacman -S iw wpa_supplicant wpa_actiond dialog
systemctl enable netctl-auto@$WIRELESS_INTERFACE
