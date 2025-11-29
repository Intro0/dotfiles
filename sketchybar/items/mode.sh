#!/bin/bash

sketchybar --add event aerospace_mode_change \
  --add item mode center \
  --set mode \
    icon.drawing=off \
    label="RESIZE" \
    label.font="CaskaydiaCove Nerd Font Mono:Bold:14.0" \
    label.color=0xffe06c75 \
    label.drawing=off \
    background.drawing=off \
    script="$CONFIG_DIR/plugins/mode.sh" \
  --subscribe mode aerospace_mode_change
