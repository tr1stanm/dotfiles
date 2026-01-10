#!/bin/bash

GIFSDIR=/home/tristan/Documents/gifs
RANDOMFILE=$(ls $GIFSDIR | grep -E ".*.gif$" | sort -R | tail -1)

$GIFSDIR/changegif.sh $RANDOMFILE

#echo "changed to $RANDOMFILE."
