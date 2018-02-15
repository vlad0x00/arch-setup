#!/bin/bash

echo "Setting up dotfiles"

cd steps/dotfiles
if [[ $? -ne 0 ]]; then
    echo "Could not open the dotfiles directory"
    return
fi

for dotfile in $(find . -mindepth 1 -maxdepth 1); do
    sudo -u $USERNAME ln -sf $(pwd)/$dotfile /home/$USERNAME/
done
