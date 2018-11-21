#!/bin/bash

set -e

#Setup environment
if [[ ! $ENVIRONMENT_SET ]]; then
    echo -n "Your username: "
    read USERNAME
    export USERNAME

    export ENVIRONMENT_SET=true
fi

export SETUP_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
cd $SETUP_DIR

SUCCESSFUL_STEPS_FILE=successful-steps

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

echo "Removing setup dir"

cd /home/$USERNAME
rm -rf $SETUP_DIR

echo "All done"
echo "You should now install graphics drivers, reboot, and enjoy."
