#!/bin/bash

SUCCESSFUL_STEPS_FILE=successful-steps

for step in $(find steps -type f | sort); do
    if [ -f $SUCCESSFUL_STEPS_FILE ] && [ ! -z $(grep $step $SUCCESSFUL_STEPS_FILE) ]; then
        continue
    fi

    . $step

    echo -e "\nPress enter to continue"
    echo "Cancel the setup (Crtl+C) if the last step was not successful"
    echo "The setup will continue from the last unsuccessful step on restart"
    read

    echo $step >>$SUCCESSFUL_STEPS_FILE
done

rm -rf $SUCCESSFUL_STEPS_FILE

echo -e "\nAll done"
echo -e "\nYou should now install graphics drivers, reboot, and enjoy."
