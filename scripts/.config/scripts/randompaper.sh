#!/bin/bash

export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export WAYLAND_DISPLAY="wayland-1"  # Or wayland-0 depending on your system

while true; do sleep 600; waypaper --random; done
