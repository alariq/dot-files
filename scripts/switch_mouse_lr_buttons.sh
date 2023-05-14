#!/usr/bin/sh

mouse_device_id=`xinput | grep 'Wireless \w* Mouse' | sed 's/.*id=\([0-9]*\).*/\1/'`
xinput set-button-map $mouse_device_id 3 2 1 4 5 6 7 8 9 
