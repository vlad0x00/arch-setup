#!/bin/bash

echo "Setting up environment variables"
. step-env.sh

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

echo "Moving to home"
. step-move.sh

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

echo -e "\nPress enter to continue"
read

echo "Setting up password for $USERNAME"
. step-passwd.sh

echo -e "\nPress enter to continue"
read

echo "Deleting original dir"
. step-delete-original.sh

echo -e "\nAll done"
echo -e "\nYou should now install graphics drivers, reboot, and enjoy."
