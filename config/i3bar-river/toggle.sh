#!/bin/sh

if [ -z "$(pgrep i3bar-river)" ]; then
	i3bar-river &
else
	killall i3bar-river
	killall i3status-rs
fi

