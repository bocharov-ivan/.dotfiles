# /bin/sh

VOLUME=$(amixer sget Master| awk -F"[][]" '/%/ { print $2; exit}')

echo Volume:$VOLUME

exit 0
