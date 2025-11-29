#!/bin/bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

# ORIGINAL: spotify in center
# sketchybar --add event spotify_change $SPOTIFY_EVENT \
#   --add item spotify center \
#   --set spotify \
#   icon.padding_left=0 \
#   icon= \
#   background.drawing=off \
#   script="$PLUGIN_DIR/spotify.sh" \
#   --subscribe spotify spotify_change

# TEMPORARY: spotify on right
sketchybar --add event spotify_change $SPOTIFY_EVENT \
  --add item spotify right \
  --set spotify \
  icon.padding_left=0 \
  icon= \
  background.drawing=off \
  script="$PLUGIN_DIR/spotify.sh" \
  --subscribe spotify spotify_change
