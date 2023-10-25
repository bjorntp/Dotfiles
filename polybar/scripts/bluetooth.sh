#!/bin/bash

if [ "$1" = "display" ]; then

	brightness_file="/sys/class/backlight/intel_backlight/brightness"
	previous_brightness=$(cat "$brightness_file")

	percent=$(bc <<<"scale=0; 100 * $previous_brightness / 120000")
	echo "$percent%"

	while (inotifywait -qe modify "$brightness_file" >/dev/null); do
		current_brightness=$(cat $brightness_file)
		if [ "$current_brightness" != "$previous_brightness" ]; then
			percent=$(bc <<<"scale=0; 100 * $current_brightness / 120000")
			echo "$percent%"
			previous_brightness="$current_brightness"
		fi
	done
else
	if [ "$1" = "up" ]; then
		brightnessctl s +5%
	else
		brightnessctl s 5%-
	fi
fi
