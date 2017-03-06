USERNAME=schutzekatze
ETHERNET_INTERFACE=$(ls /sys/class/net | grep -m 1 en)
WIRELESS_INTERFACE=$(ls /sys/class/net | grep -m 1 wl)

export $USERNAME
export $ETHERNET_INTERFACE
export $WIRELESS_INTERFACE
