#!/bin/bash

musicfile="$HOME/.cache/hyprlock/musicdata.txt"
artfile="$HOME/.cache/hyprlock/albumart.png"
artfile_jpg="$HOME/.cache/hyprlock/albumart.jpg"

last_track=""
last_text=""

cleanup_art() {
  magick -size 200x200 xc:none ~/.cache/hyprlock/albumart.png 
}

update_art() {
  local url="$1"
  if [[ -z "$url" ]]; then
    cleanup_art
    return
  fi

  if [[ "$url" == file://* ]]; then
    local file_path="${url#file://}"
    if [[ -f "$file_path" ]]; then
      cp "$file_path" "$artfile"
    else
      cleanup_art
    fi
  else
    curl -sf "$url" -o "$artfile_jpg" && magick "$artfile_jpg" -blur 0x1 -brightness-contrast -10x-40 "$artfile" && rm "$artfile_jpg" || cleanup_art
  fi
}

# Run metadata and status follow in background, prefix lines to identify source
metadata_listener() {
  playerctl metadata --format '{{artist}} - {{title}}' --follow | while read -r line; do
    echo "METADATA::$line"
  done
}

status_listener() {
  playerctl status --follow | while read -r line; do
    echo "STATUS::$line"
  done
}

# Main event loop reading combined input
{
  metadata_listener &
  status_listener &
  wait
} | while read -r line; do
  if [[ "$line" == METADATA::* ]]; then
    current_track="${line#METADATA::}"
  elif [[ "$line" == STATUS::* ]]; then
    status="${line#STATUS::}"
  fi

  # Only update if we have current track and status info
  if [[ -n "$current_track" && -n "$status" ]]; then
    # Update text file if track changed or stopped
    if [[ "$status" == "Playing" ]]; then
      if [[ "$current_track" != "$last_text" ]]; then
        echo "$current_track" > "$musicfile"
        last_text="$current_track"
      fi
    else
      if [[ -n "$last_text" ]]; then
        echo "" > "$musicfile"
        last_text=""
      fi
    fi

    # Update album art on track change or clear on pause/stop
    if [[ "$status" != "Playing" ]]; then
      cleanup_art
      last_track=""
    elif [[ "$current_track" != "$last_track" ]]; then
      last_track="$current_track"
      art_url=$(playerctl metadata --format '{{mpris:artUrl}}' 2>/dev/null || echo "")
      update_art "$art_url"
    fi
  fi
done
