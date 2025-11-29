#!/bin/bash

MAX_LENGTH=35
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))

PLAYING=$(osascript -e 'tell application "System Events" to (name of processes) contains "Spotify"' 2>/dev/null)

if [ "$PLAYING" = "true" ]; then
  STATE=$(osascript -e 'tell application "Spotify" to player state as string' 2>/dev/null)

  if [ "$STATE" = "playing" ]; then
    TRACK=$(osascript -e 'tell application "Spotify" to name of current track as string' 2>/dev/null)
    ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track as string' 2>/dev/null)

    if [ -z "$TRACK" ] && [ -z "$ARTIST" ]; then
      sketchybar --set $NAME drawing=off
      exit
    fi

    TRACK_LENGTH=${#TRACK}
    ARTIST_LENGTH=${#ARTIST}

    if [ $((TRACK_LENGTH + ARTIST_LENGTH)) -gt $MAX_LENGTH ]; then
      if [ "$TRACK_LENGTH" -gt $HALF_LENGTH ] && [ "$ARTIST_LENGTH" -gt $HALF_LENGTH ]; then
        TRACK="${TRACK:0:$((MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1))}…"
        ARTIST="${ARTIST:0:$((HALF_LENGTH - 2))}…"
      elif [ "$TRACK_LENGTH" -gt $HALF_LENGTH ]; then
        TRACK="${TRACK:0:$((MAX_LENGTH - ARTIST_LENGTH - 1))}…"
      elif [ "$ARTIST_LENGTH" -gt $HALF_LENGTH ]; then
        ARTIST="${ARTIST:0:$((MAX_LENGTH - TRACK_LENGTH - 1))}…"
      fi
    fi

    MEDIA="${TRACK} - ${ARTIST}"
    sketchybar --set $NAME label="$MEDIA" drawing=on
  else
    sketchybar --set $NAME drawing=off
  fi
else
  sketchybar --set $NAME drawing=off
fi
