#!/bin/bash

if [ "$1" = "display" ]; then
	brightness=$(brightnessctl g)
	percent=$(bc <<<"scale=0; 100 * $brightness / 120000")
	echo "$percent%"
else
	if [ "$1" = "up" ]; then
		brightnessctl s +5%
	else
		brightnessctl s 5%-
	fi
	brightness=$(brightnessctl g)
	percent=$(bc <<<"scale=0; 100 * $brightness / 120000")
	echo "$percent%"
fi
