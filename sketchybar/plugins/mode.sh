#!/bin/bash

if [ "$MODE" = "resize" ]; then
  sketchybar --set mode label.drawing=on
else
  sketchybar --set mode label.drawing=off
fi
