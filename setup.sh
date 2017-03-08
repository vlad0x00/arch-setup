#!/bin/bash

echo "Setting up environment variables"
. steps/step-env.sh

echo -e "\nPress enter to continue"
read

echo "Installing xorg"
. steps/step-xorg.sh

echo -e "\nPress enter to continue"
read

echo "Setting up wifi"
. steps/step-wifi.sh

echo -e "\nPress enter to continue"
read

echo "Creating user"
. steps/step-create-user.sh

echo -e "\nPress enter to continue"
read

echo "Moving to home"
. steps/step-move.sh

echo -e "\nPress enter to continue"
read

echo "Installing user apps"
. steps/step-user-apps.sh

echo -e "\nPress enter to continue"
read

echo "Setting up dotfiles"
. steps/step-dotfiles.sh

echo -e "\nPress enter to continue"
read

echo "Setting up swapfile"
. steps/step-swapfile.sh

echo -e "\nPress enter to continue"
read

echo "Installing yaourt"
. steps/step-yaourt.sh

echo -e "\nPress enter to continue"
read

echo "Installing yaourt apps"
. steps/step-yaourt-apps.sh

echo -e "\nPress enter to continue"
read

echo "Setting up password for $USERNAME"
. steps/step-passwd.sh

echo -e "\nPress enter to continue"
read

echo "Setting up power management"
. steps/step-power-management.sh

echo -e "\nPress enter to continue"
read

echo "Deleting original dir"
. steps/step-delete-original.sh

echo -e "\nAll done"
echo -e "\nYou should now install graphics drivers, reboot, and enjoy."
