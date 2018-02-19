#!/bin/bash

echo "Installing AUR packages"

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) NOPASSWD: ALL\)/\1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null

sudo -u $USERNAME pacaur -S google-chrome ttf-google-fonts-git i3-gaps-next-git yabar-git

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) NOPASSWD: ALL\)/# \1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null
