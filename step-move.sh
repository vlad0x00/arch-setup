#!/bin/bash

wd=$(pwd)

cp -r $wd /home/$USERNAME/
chown -R $USERNAME:$USERNAME /home/$USERNAME/$(basename $wd)
cd /home/$USERNAME/$(basename $wd)
