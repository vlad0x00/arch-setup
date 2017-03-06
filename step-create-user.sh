#!/bin/bash

useradd -m -s /bin/bash $USERNAME
usermod -a -G wheel,audio,video $USERNAME

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) ALL\)/\1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null
