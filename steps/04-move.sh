#!/bin/bash

if [[ $MOVED ]]; then
    return
fi

echo "Moving to home"

if [[ "$(dirname $SETUP_DIR)" == "/home/$USERNAME" ]]; then
    echo "Already at home - skipping step"
    chown -R $USERNAME:$USERNAME .
    return
fi

cp -r $SETUP_DIR /home/$USERNAME/
chown -R $USERNAME:$USERNAME /home/$USERNAME/$(basename $SETUP_DIR)
cd /home/$USERNAME/$(basename $SETUP_DIR)
rm -rf $SETUP_DIR
export SETUP_DIR=$(pwd)
export MOVED=true

. setup.sh
exit

