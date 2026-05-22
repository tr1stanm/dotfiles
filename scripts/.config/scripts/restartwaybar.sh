#!/bin/bash

pkill waybar
sleep 0.2
setsid waybar >/dev/null 2>&1 &
