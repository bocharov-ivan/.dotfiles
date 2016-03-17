#!/bin/sh

BRIGHTNESS=$(xbacklight| awk '{ val = $1}; END { print int(val) }')

echo Screen:$BRIGHTNESS%

exit 0
