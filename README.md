# Arch Setup

This is a simple automation for Arch Linux setup.

First make sure to (as instructed by Arch Wiki install page / update as needed):
- timedatectl set-ntp true
- Create, format, and mount the partitions (one for bootloader (/boot) and one for OS (/))
- Setup full disk encryption
- genfstab -U /mnt >> /mnt/etc/fstab

Then run ./setup.sh

The script executes steps from the steps folder in the order they're numbered. After every step, an opportunity is given to examine the console output and make sure everything went well. If any step fails, you can fix the error(s) and resume by running the script again, which automatically continuing from the last successful step.
