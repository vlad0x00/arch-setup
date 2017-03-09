#!/bin/bash

echo "Setting up power management"

pacman -S powertop
echo \
'[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
ExecStart=/usr/bin/powertop --auto-tune

[Install]
WantedBy=multi-user.target' >/etc/systemd/system/powertop.service
systemctl enable powertop

echo "Power management by powertop has been enabled."
echo "You should run 'powertop -c' after the installation to calibrate powertop."
