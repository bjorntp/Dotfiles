#!/bin/sh

if [ "$1" = "status" ]; then
	if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
		if bluetoothctl show | grep -q "Powered: yes"; then
			if [ "$(bluetoothctl devices Connected | wc -l)" = "0" ]; then
				echo ON
			else
				echo CONNECTED
			fi
		else
			echo OFF
		fi
	else
		echo 'SERVICE DISABLED'
	fi
	sleep 1
else
	if bluetoothctl show | grep -q "Powered: no"; then
		bluetoothctl power on
	else
		bluetoothctl power off
	fi
fi
