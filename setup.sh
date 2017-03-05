#!/bin/bash

USER=schutzekatze

pacman -S xorg-server xorg-server-devel xorg-utils xorg-server-utils xorg-xrandr xorg-xinput xbindkeys mesa dmenu xcompmgr

echo -e "\nPress enter to continue"
read

#=============================================================

pacman -S wpa_supplicant wpa_actiond
ethernet_interface=$(ls /sys/class/net | grep -m 1 en)
wireless_interface=$(ls /sys/class/net | grep -m 1 wl)
systemctl enable netctl-auto@$wireless_interface

echo -e "\nPress enter to continue"
read

#=============================================================

pacman -S qt5-base vlc pulseaudio chromium gedit eclipse-cpp geogebra htop iotop libreoffice-fresh jdk8-openjdk openjdk8-doc openjdk8-src \
java-openjfx java-openjfx-doc java-openjfx-src gimp cowsay lolcat fortune-mod netbeans nmap openssh python php sl \
transmission-qt tree xfce4-terminal shotwell feh php noto-fonts-cjk noto-fonts-emoji neovim feh nautilus conky

echo -e "\nPress enter to continue"
read

#=============================================================

useradd -m -s /bin/bash $USER
usermod -a -G wheel,audio,video $USER
#cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) ALL\)/\1/' | tee /etc/sudoers >/dev/null

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
    mkdir -p /home/$USER/$(dirname $dotfile)/
    ln -sf $(pwd)/$dotfile /home/$USER/$(dirname $dotfile)/
    chown -h $USER:$USER /home/$USER/$(dirname $dotfile)/$(basename $dotfile)
done

cd $wd

echo -e "\nPress enter to continue"
read

#=============================================================

wd=$(pwd)

sudo -u $USER wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz && \
sudo -u $USER tar zxf yaourt.tar.gz && \
cd yaourt && \
sudo -u $USER makepkg -sri

cd $wd
rm -rf yaourt && rm -rf yaourt.tar.gz

echo -e "\nPress enter to continue"
read

#=============================================================

sudo -u $USER yaourt -S google-chrome ttf-google-fonts-git teamviewer i3-gaps

echo -e "\nAll done"
