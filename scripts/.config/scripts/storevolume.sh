#!/bin/bash

while [ true ]; do
    wpctl get-volume @DEFAULT_AUDIO_SINK@ > /tmp/currentvolume.txt
    sleep 0.5
done
