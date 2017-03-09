#!/bin/bash

echo "Setting up swapfile"

echo -n "Swapfile size (M = Mebibytes, G = Gibibytes, for example, 4G): "
read swapfile_size
fallocate -l $swapfile_size /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile	none	swap	defaults	0	0" >>/etc/fstab
