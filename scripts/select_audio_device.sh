#!/bin/sh

BASEDIR=$(dirname $0)

pactl set-default-sink $(pactl list | $BASEDIR/awk_test.sh | dmenu -l 5 -b | awk '{ print $1 }')
