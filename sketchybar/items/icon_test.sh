#!/bin/bash

# Temporary: Show all app icons for alignment testing

APPS=("Akiflow" "Discord" "Spotify" "Vivaldi" "Warp" "Zed")

for app in "${APPS[@]}"; do
  icon=$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")
  offset=$($CONFIG_DIR/plugins/icon_map_fn.sh "$app" offset)
  sketchybar --add item "test_$app" center \
    --set "test_$app" \
    label="$icon" \
    label.font="sketchybar-app-font:Regular:16.0" \
    label.color=0xffabb2bf \
    label.y_offset=$offset \
    icon="$app:" \
    icon.font="CaskaydiaCove Nerd Font Mono:Regular:10.0" \
    icon.color=0xff636d83 \
    background.drawing=off
done

# Add a center line indicator
sketchybar --add item center_line center \
  --set center_line \
  icon="────────────────────────────────────────" \
  icon.font="CaskaydiaCove Nerd Font Mono:Regular:8.0" \
  icon.color=0xffe06c75 \
  icon.y_offset=0 \
  label.drawing=off \
  background.drawing=off
