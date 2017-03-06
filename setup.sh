#!/bin/bash

echo "Setting up environment variables"
. env-setup.sh

echo -e "\nPress enter to continue"
read

echo "Installing xorg"
. step-xorg.sh

echo -e "\nPress enter to continue"
read

echo "Setting up wifi"
. step-wifi.sh

echo -e "\nPress enter to continue"
read

echo "Installing user apps"
. step-user-apps.sh

echo -e "\nPress enter to continue"
read

echo "Creating user"
. step-create-user.sh

echo -e "\nPress enter to continue"
read

echo "Setting up dotfiles"
. step-dotfiles.sh

echo -e "\nPress enter to continue"
read

echo "Setting up swapfile"
. step-swapfile.sh

echo -e "\nPress enter to continue"
read

echo "Installing yaourt"
. step-yaourt.sh

echo -e "\nPress enter to continue"
read

echo "Installing yaourt apps"
. step-yaourt-apps.sh

echo -e "\nAll done"
echo -e "\nYou should now install graphics drivers, set password for $USERNAME, reboot, and enjoy."
