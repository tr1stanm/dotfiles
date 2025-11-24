#!/bin/bash

GIFNAME=$1
CURRDIR=/home/tristan/.config/nautilus/gifs

if [ -z "$1" ]; then
    echo "changegif needs a gif file to use."
    echo "usage: ./changegif.sh <filename>"
    echo "exiting..."
    exit
fi

if [ ! -f "$CURRDIR/$GIFNAME" ]; then
    echo "$GIFNAME does not exist. exiting..."
    exit
fi

#systemctl stop OpenLinkHub

rm /opt/OpenLinkHub/database/lcd/images/*
cp $CURRDIR/"$GIFNAME" /opt/OpenLinkHub/database/lcd/images


NAME_NO_EXT="${GIFNAME%.*}"

PROFILE="/opt/OpenLinkHub/database/profiles/AB61F53110B3K1.json"

tmpfile=$(mktemp)

jq --arg img "$NAME_NO_EXT" \
   '.LCDMode = 10 | .LCDImage = $img' \
   "$PROFILE" > "$tmpfile" && mv "$tmpfile" "$PROFILE"

chown openlinkhub "$PROFILE"
chgrp openlinkhub "$PROFILE"
chmod a+r "$PROFILE"

systemctl daemon-reload
systemctl restart OpenLinkHub
