#!/bin/bash
dir="$HOME/Pictures/wallpapers"
state="$HOME/.cache/wallpaper"
cur=$(cat "$state" 2>/dev/null)

if [ "$1" = "restore" ] && [ -f "$cur" ]; then
    new="$cur"
else
    new=$(find "$dir" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) ! -path "$cur" | shuf -n1)
    [ -z "$new" ] && new="$cur"
fi

pkill swaybg
swaybg -i "$new" -m fill >/dev/null 2>&1 &
disown
echo "$new" > "$state"
