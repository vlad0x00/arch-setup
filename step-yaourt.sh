#!/bin/bash

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) NOPASSWD: ALL\)/\1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null

wd=$(pwd)

cd /home/$USERNAME

wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz && \
tar zxf package-query.tar.gz && \
cd package-query && \
chown -R $USERNAME:$USERNAME . && \
sudo -u $USERNAME makepkg -sri

cd /home/$USERNAME
rm -rf package-query && rm -rf package-query.tar.gz

wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz && \
tar zxf yaourt.tar.gz && \
cd yaourt && \
chown -R $USERNAME:$USERNAME . && \
sudo -u $USERNAME makepkg -sri

cd /home/$USERNAME
rm -rf yaourt && rm -rf yaourt.tar.gz

cd $wd

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) NOPASSWD: ALL\)/# \1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null
