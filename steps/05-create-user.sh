#!/bin/bash

echo "Creating user"

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) ALL\)/\1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null

id -u $USERNAME &>/dev/null
if [[ $? -eq 0 ]]; then
    echo "User $USERNAME already exists"
    return
fi

useradd -m -s /bin/bash $USERNAME
usermod -a -G wheel,audio,video $USERNAME

echo "Setting up password"

passwd $USERNAME

echo "Making home dirs"

cd /home/$USERNAME
mkdir -p work/projects
mkdir -p random
mkdir -p tools/bin
mkdir -p wallpapers
