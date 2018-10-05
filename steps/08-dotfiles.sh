#!/bin/bash

echo "Setting up dotfiles"

cd /home/$USERNAME
sudo -u $USERNAME git clone https://github.com/schutzekatze/dotfiles
cd dotfiles
sudo -u $USERNAME dotfiles/setup.sh
