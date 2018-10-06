#!/bin/bash

echo "Installing pacaur"

cd /home/$USERNAME

pacman -S wget

wget https://aur.archlinux.org/cgit/aur.git/snapshot/cower.tar.gz && \
tar zxf cower.tar.gz && \
cd cower && \
chown -R $USERNAME:$USERNAME . && \
sudo -u $USERNAME makepkg -sri --skippgpcheck

cd /home/$USERNAME
rm -rf cower && rm -rf cower.tar.gz

wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz && \
tar zxf pacaur.tar.gz && \
cd pacaur && \
chown -R $USERNAME:$USERNAME . && \
sudo -u $USERNAME makepkg -sri --skippgpcheck

cd /home/$USERNAME
rm -rf pacaur && rm -rf pacaur.tar.gz

changed_makepkg=$(cat /etc/makepkg.conf | sed "s/PKGEXT='.pkg.tar.zx'/PKGEXT='.pkg.tar'/")
echo "$changed_makepkg" | tee /etc/makepkg.conf >/dev/null
