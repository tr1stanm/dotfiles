#!/usr/bin/env bash

export PATH=/usr/local/bin:/usr/bin:/bin
export XDG_RUNTIME_DIR=/run/user/1000
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export COLORTERM=truecolor
export TERM=xterm-kitty

btop &
sleep 1
wal -R >/dev/null 2>&1 &
