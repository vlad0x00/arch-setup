#!/bin/bash

echo "Installing yaourt apps"

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) NOPASSWD: ALL\)/\1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null

sudo -u $USERNAME pacaur -S google-chrome ttf-google-fonts-git i3-gaps

sudo -u $USERNAME xdg-mime default google-chrome.desktop text/html
sudo -u $USERNAME xdg-mime default google-chrome.desktop x-scheme-handler/http
sudo -u $USERNAME xdg-mime default google-chrome.desktop x-scheme-handler/https
sudo -u $USERNAME xdg-mime default google-chrome.desktop x-scheme-handler/about

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) NOPASSWD: ALL\)/# \1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null
