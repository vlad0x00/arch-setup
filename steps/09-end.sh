#!/bin/bash

echo "Removing setup dir"

rm -rf $SETUP_DIR

echo "Enabling root password prompt"

changed_sudoers=$(cat /etc/sudoers | sed 's/.*\(%wheel ALL=(ALL) NOPASSWD: ALL\)/# \1/')
echo "$changed_sudoers" | tee /etc/sudoers >/dev/null
