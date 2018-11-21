# Arch Setup

This is a simple automation of setting up Arch Linux.

First make sure to:
- timedatectl set-ntp true
- Create, format and mount the partitions (one for bootloader (/boot) and one for OS (/))
- genfstab -U /mnt >> /mnt/etc/fstab

Then you can run this script.

The setup.sh script executes steps from the steps folder in the order they're numbered, so it's fairly easy to
edit the automation and add or remove steps.

The script also pauses after each step, letting you examine the text output, and see if everything went well.
If any step fails, you're given the opportunity to fix the error(s) and resume by running the setup.sh again, continuing from the step you canceled by running it again.

Although the script is used for Arch Linux and my environment, it can easily be adjusted to fit any distro or preferences.
