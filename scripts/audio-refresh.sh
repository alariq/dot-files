#!/bin/bash

[[ $UID = 0 ]] || exec sudo "$0"

echo 1 > '/sys/bus/pci/devices/0000:00:1b.0/remove'
#echo 1 > '/sys/bus/usb/devices/3-3/remove'
sleep 1
echo 1 > /sys/bus/pci/rescan

