#!/bin/bash

echo "Setting up dotfiles"

cd /home/$USERNAME
rm -rf dotfiles
sudo -u $USERNAME git clone https://github.com/schutzekatze/dotfiles
cd dotfiles
sudo -u $USERNAME ./setup.sh
