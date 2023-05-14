#!/bin/sh

echo dev: ${DEVICE} action: ${ACTION} >> /tmp/ymdk-events.log
xset r rate 200 50
if [ "${ACTION}" = "add" ] && [ -f "${DEVICE}" ]
then
    echo ${DEVICE} >> /tmp/ymdk-events.log
    xset r rate 200 50
fi





