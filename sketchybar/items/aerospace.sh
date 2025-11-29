#!/bin/bash

# Adapted from durocodes config - using aerospace instead of hyprspace
# Atom One Dark Pro colors
HIGHLIGHT=0x8061afef        # Transparent blue
FOREGROUND=0xffffffff       # White for better contrast on blue
FOREGROUND_INACTIVE=0xffabb2bf
ACCENT=0xff61afef

ALL_WORKSPACES=$(aerospace list-workspaces --all)

for sid in $ALL_WORKSPACES; do
  sketchybar --add item space.$sid center \
    --subscribe space.$sid aerospace_workspace_change front_app_switched \
    --set space.$sid \
    background.color=$HIGHLIGHT \
    background.corner_radius=5 \
    background.height=26 \
    background.drawing=off \
    background.padding_left=0 \
    background.padding_right=0 \
    icon="$sid" \
    icon.color=$FOREGROUND \
    icon.font="CaskaydiaCove Nerd Font Mono:Bold:12.0" \
    icon.padding_left=8 \
    icon.padding_right=8 \
    label.color=$FOREGROUND \
    label.padding_left=0 \
    label.padding_right=8 \
    label.font="sketchybar-app-font:Regular:16.0" \
    label.y_offset=1 \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"

  if [[ $sid != $(echo "$ALL_WORKSPACES" | tail -n1) ]]; then
    sketchybar --add item space_separator.$sid center \
      --set space_separator.$sid \
      icon="" \
      icon.color=0xff636d83 \
      icon.padding_left=8 \
      icon.font="CaskaydiaCove Nerd Font Mono:Regular:20.0" \
      label.drawing=off
  fi
done
