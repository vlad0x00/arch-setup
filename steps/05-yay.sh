#!/bin/bash

echo "Installing yay"

cd /home/$USERNAME

pacman -S wget

wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz && \
tar zxf yay.tar.gz && \
cd yay && \
chown -R $USERNAME:$USERNAME . && \
sudo -u $USERNAME makepkg -sri --skippgpcheck

cd /home/$USERNAME
rm -rf yay && rm -f yay.tar.gz

changed_makepkg=$(cat /etc/makepkg.conf | sed "s/PKGEXT='.pkg.tar.zx'/PKGEXT='.pkg.tar'/")
echo "$changed_makepkg" | tee /etc/makepkg.conf >/dev/null
