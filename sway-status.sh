#!/usr/bin/bash
export xxx=$(swaymsg -t get_inputs | grep xkb_active_layout_name | tr -d "\",()" | cut -d: -f2 | sort -u | tr -d '\n')
export bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ { print $2 }')
date +"${xxx} | ${bat} | %A %d-%m-%Y | week %V | %I:%M:%S %p"
