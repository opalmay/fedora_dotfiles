#!/bin/sh
if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom -b --config ~/.config/picom.conf --experimental-backends
fi
