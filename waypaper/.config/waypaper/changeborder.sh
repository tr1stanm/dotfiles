#!/bin/bash

activeborder1=$(jq -r '.colors.color7' ~/.cache/wal/colors.json | sed 's/#//g')
activeborder2=$(jq -r '.colors.color4' ~/.cache/wal/colors.json | sed 's/#//g')
inactiveborder=$(jq -r '.colors.color1' ~/.cache/wal/colors.json | sed 's/#//g')

sed -i "s/col.active_border =.*/col.active_border = rgb($activeborder1) rgb($activeborder2) 45deg/" ~/.config/hypr/hyprland.conf
sed -i "s/col.inactive_border =.*/col.inactive_border = rgb($inactiveborder)/" ~/.config/hypr/hyprland.conf
