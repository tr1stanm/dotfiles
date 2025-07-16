#!/bin/bash

color=$(jq -r '.colors.color4' ~/.cache/wal/colors.json | sed 's/#//g')

cherryrgb_cli animation wave slow "$color"
