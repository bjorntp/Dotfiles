#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "OFF"
else
  if [ $(bluetoothctl devices Connected | wc -c) -ne 0 ]
  then 
    echo $(bluetoothctl devices Connected | sed -E 's/.* //')
  fi
  echo "ON"
fi
