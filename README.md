# Arch Setup

Step-by-step script for <a href="https://www.archlinux.org/" target="_blank">Arch Linux</a> setup.

First, follow <a href="https://wiki.archlinux.org/index.php/Installation_guide" target="_blank">Arch Wiki installation guide</a> up until chrooting into the pacstrapped system, then clone this repository and run `./setup.sh`

The script executes steps from the `steps` directory in the order they're numbered. After every step, an opportunity is given to examine the console output and make sure everything went well. If any step fails, you can fix the error(s) and resume by re-running the script, which continues from the last successful step.
