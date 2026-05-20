#!/bin/bash

activeborder1=$(jq -r '.colors.color7' ~/.cache/wal/colors.json | sed 's/#//g')
activeborder2=$(jq -r '.colors.color4' ~/.cache/wal/colors.json | sed 's/#//g')
inactiveborder=$(jq -r '.colors.color1' ~/.cache/wal/colors.json | sed 's/#//g')

sed -i "s/active_border =.*/active_border = { colors = { \"rgb($activeborder1)\", \"rgb($activeborder2)\", angle = 45 }},/" ~/.config/hypr/hyprland/general.lua
sed -i "s/inactive_border =.*/inactive_border = \"rgb($inactiveborder)\"/" ~/.config/hypr/hyprland/general.lua
