#!/bin/bash

set -e

SUCCESSFUL_STEPS_FILE=successful-steps
USERNAME_FILE=username
COMPUTER_NAME_FILE=computer-name

if [ -f $USERNAME_FILE ]; then
    USERNAME=$(cat $USERNAME_FILE)
else
    echo -n "Your username: "
    read USERNAME
    echo -n $USERNAME >$USERNAME_FILE
fi
export USERNAME

if [ ! -f $COMPUTER_NAME_FILE ]; then
    echo -n "Computer name: "
    read computer_name
    echo $computer_name >$COMPUTER_NAME_FILE
    echo $computer_name >/etc/hostname
fi

export SETUP_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
cd $SETUP_DIR

#Execute steps
for step in $(find steps/* -maxdepth 0 -type f | sort); do
    if [ -f $SUCCESSFUL_STEPS_FILE ] && [ ! -z $(grep $step $SUCCESSFUL_STEPS_FILE) ]; then
        continue
    fi

    . $step

    echo -e "\nPress enter to continue"
    echo "Cancel the setup (Ctrl+C) if the last step was not successful"
    echo "The setup will continue from the last unsuccessful step on restart"
    read

    cd $SETUP_DIR
    echo $step >>$SUCCESSFUL_STEPS_FILE
done

echo "Removing setup dir."

cd /home/$USERNAME
rm -rf $SETUP_DIR

echo "Setup finished."
echo "Things missing: graphics drivers and /home/wallpapers."
