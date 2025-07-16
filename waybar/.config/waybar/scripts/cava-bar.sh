#!/bin/bash

# Start cava in stdout mode and read the first line of output only
cava -p ~/.config/cava/cava-waybar.conf | \
while read -r line; do
  # convert semicolon-separated values to vertical bars
  bars=""
  IFS=';' read -ra vals <<< "$line"
  for val in "${vals[@]}"; do
    # Convert value (0–9) to bar character
    case $val in
      0) bars+="▁";;
      1) bars+="▂";;
      2) bars+="▃";;
      3) bars+="▄";;
      4) bars+="▅";;
      5) bars+="▆";;
      6) bars+="▇";;
      *) bars+="█";;
    esac
  done
  echo "$bars"
  sleep 0.05
done

