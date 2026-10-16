#!/bin/bash
layout=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | head -n1)
case "$layout" in
    *Russian*) echo "RU" ;;
    *English*) echo "EN" ;;
    *)         echo "${layout:0:2}" ;;
esac
