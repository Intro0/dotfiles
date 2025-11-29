#!/bin/bash

# ORIGINAL: front_app on left with chevron
# sketchybar --add item chevron left --set chevron icon='' label.drawing=off
#
# sketchybar --add item front_app left \
#   --set front_app \
#   icon.font="sketchybar-app-font:Regular:16.0" \
#   script="$PLUGIN_DIR/front_app.sh" \
#   --subscribe front_app front_app_switched

# TEMPORARY: front_app on left
sketchybar --add item front_app left \
  --set front_app \
  icon.font="sketchybar-app-font:Regular:16.0" \
  script="$PLUGIN_DIR/front_app.sh" \
  --subscribe front_app front_app_switched
