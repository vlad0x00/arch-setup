#!/bin/bash

echo "Setting up power management"

pacman -S tlp
systemctl enable tlp.service

echo "TLP power management has been enabled."
