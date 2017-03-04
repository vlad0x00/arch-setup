#!/bin/bash

pacman -S xorg-server xorg-server-devel xorg-utils xorg-server-utils xorg-xrandr xorg-xinput xbindkeys mesa i3 dmenu xcompmgr

echo -e "\nPress enter to continue"
read

#=============================================================

pacman -S wpa_supplicant wpa_actiond
ethernet_interface=$(ls /sys/class/net | grep en)
wireless_interface=$(ls /sys/class/net | grep wl)
systemctl enable netctl-auto@$wireless_interface

echo -e "\nPress enter to continue"
read

#=============================================================

pacman -S qt5-base vlc pulseaudio chromium gedit eclipse-cpp geogebra htop iotop libreoffice-fresh jdk8-openjdk openjdk8-doc openjdk8-src \
java-openjfx java-openjfx-doc java-openjfx-src gimp cowsay lolcat fortune-mod netbeans nmap openssh python php sl \
transmission-qt tree wine xfce4-terminal shotwell feh php noto-fonts-cjk noto-fonts-emoji

echo -e "\nPress enter to continue"
read

#=============================================================

useradd -m -s /bin/bash schutzekatze
usermod -a -G wheel,audio,video schutzekatze
cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) ALL\)/\1/' | tee /etc/sudoers >/dev/null

echo -e "\nPress enter to continue"
read

#=============================================================

wd=$(pwd)
cd dotfiles

fixed_i3status=$(cat .i3status.conf \
| sed "s/wireless \([[:alnum:]]*\)/wireless $wireless_interface/g" \
| sed "s/ethernet \([[:alnum:]]*\)/ethernet $ethernet_interface/g")
echo "$fixed_i3status" >.i3status.conf

echo -e "\nPress enter to continue"
read

for dotfile in $(find . ! -type d); do
    ln -sf $(pwd)/$dotfile /home/schutzekatze/$(dirname $dotfile)/
    chown -h schutzekatze:schutzekatze /home/schutzekatze/$(dirname $dotfile)/$(basename $dotfile)
done

cd $wd

echo -e "\nPress enter to continue"
read

#=============================================================

wd=$(pwd)

sudo -u schutzekatze wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz && \
sudo -u schutzekatze tar zxf yaourt.tar.gz && \
cd yaourt && \
sudo -u schutzekatze makepkg -sri

cd $wd
rm -rf yaourt && rm -rf yaourt.tar.gz

echo -e "\nPress enter to continue"
read

#=============================================================

sudo -u schutzekatze yaourt -S google-chrome ttf-google-fonts-git teamviewer

echo -e "\nAll done"
