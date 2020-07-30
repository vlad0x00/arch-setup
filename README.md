# Arch Setup

Step-by-step script for [Arch Linux](https://www.archlinux.org/) setup.

Before running this, execute the following prerequiste steps, as per [Arch Wiki installation guide](https://wiki.archlinux.org/index.php/Installation_guide). Check the wiki page in case the steps are outdated.
- timedatectl set-ntp true
- Create, format, and mount the partitions (one for bootloader (/boot) and one for OS (/))
- Setup full disk encryption
- genfstab -U /mnt >> /mnt/etc/fstab

Then clone this repository and run ./setup.sh

The script executes steps from the steps folder in the order they're numbered. After every step, an opportunity is given to examine the console output and make sure everything went well. If any step fails, you can fix the error(s) and resume by running the script again, which automatically continuing from the last successful step.
