#!/bin/bash

echo "Creating user"

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) ALL\)/\1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null

id -u $USERNAME >/dev/null
if [[ $? -eq 0 ]]; then
    echo "User $USERNAME already exists"
    return
fi

useradd -m -s /bin/bash $USERNAME
usermod -a -G wheel,audio,video $USERNAME
