#!/bin/bash

wd=$(pwd)

if [ "$(dirname $wd)" == "/home/$USERNAME" ]; then
    echo "Already at home - skipping step"
    chown -R $USERNAME:$USERNAME .
    exit
fi

cp -r $wd /home/$USERNAME/
chown -R $USERNAME:$USERNAME /home/$USERNAME/$(basename $wd)
cd /home/$USERNAME/$(basename $wd)
