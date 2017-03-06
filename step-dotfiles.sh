#!/bin/bash

wd=$(pwd)
chown -R $USERNAME:$USERNAME $wd

cd dotfiles

fixed_i3status=$(cat .i3status.conf \
| sed "s/wireless \([[:alnum:]]*\)/wireless $WIRELESS_INTERFACE/g" \
| sed "s/ethernet \([[:alnum:]]*\)/ethernet $ETHERNET_INTERFACE/g")
echo "$fixed_i3status" >.i3status.conf

for dotfile in $(find . ! -type d); do
    sudo -u $USERNAME mkdir -p /home/$USERNAME/$(dirname $dotfile)/
    sudo -u $USERNAME ln -sf $(pwd)/$dotfile /home/$USERNAME/$(dirname $dotfile)/
done

cd $wd
