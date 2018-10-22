#!/bin/bash

echo "Installing yay"

cd /home/$USERNAME

pacman -S wget

wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz && \
tar zxf pacaur.tar.gz && \
cd pacaur && \
chown -R $USERNAME:$USERNAME . && \
sudo -u $USERNAME makepkg -sri --skippgpcheck

cd /home/$USERNAME
rm -rf yay && rm -rf yay.tar.gz

changed_makepkg=$(cat /etc/makepkg.conf | sed "s/PKGEXT='.pkg.tar.zx'/PKGEXT='.pkg.tar'/")
echo "$changed_makepkg" | tee /etc/makepkg.conf >/dev/null
