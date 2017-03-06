#!/bin/bash

wd=$(pwd)

cd /home/$USERNAME

sudo -u $USERNAME wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz && \
sudo -u $USERNAME tar zxf package-query.tar.gz && \
cd package-query && \
sudo -u $USERNAME makepkg -sri

cd /home/$USERNAME
rm -rf package-query && rm -rf package-query.tar.gz

sudo -u $USERNAME wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz && \
sudo -u $USERNAME tar zxf yaourt.tar.gz && \
cd yaourt && \
sudo -u $USERNAME makepkg -sri

cd /home/$USERNAME
rm -rf yaourt && rm -rf yaourt.tar.gz

cd $wd
