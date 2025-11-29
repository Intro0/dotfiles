#!/usr/bin/env bash

# Adapted for aerospace (from hyprspace)

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

update_workspace_icon() {
    local workspace_id=$1

    # Get the focused app in this workspace (if this is the focused workspace)
    # Otherwise get the first app in the workspace
    local APP_NAME=""
    local APP_ICONS=""
    local y_offset=0

    if [ "$workspace_id" == "$FOCUSED_WORKSPACE" ]; then
        APP_NAME=$(aerospace list-windows --focused --format '%{app-name}' 2>/dev/null)
    else
        APP_NAME=$(aerospace list-windows --workspace $workspace_id --format '%{app-name}' 2>/dev/null | head -n 1)
    fi

    if [ -n "$APP_NAME" ]; then
        APP_ICONS=$($CONFIG_DIR/plugins/icon_map_fn.sh "$APP_NAME")
        y_offset=$($CONFIG_DIR/plugins/icon_map_fn.sh "$APP_NAME" offset)
    fi

    # Trim whitespace
    APP_ICONS=$(echo "$APP_ICONS" | xargs)

    if [ "$workspace_id" == "$FOCUSED_WORKSPACE" ]; then
        if [ -z "$APP_ICONS" ]; then
            # Empty workspace - just show the workspace name, no label
            sketchybar --set $NAME label="" label.drawing=off background.drawing=on label.y_offset=$y_offset
        else
            # Has apps - show the icons
            sketchybar --set $NAME label="$APP_ICONS" label.drawing=on background.drawing=on label.y_offset=$y_offset
        fi
    else
        if [ -z "$APP_ICONS" ]; then
            sketchybar --set $NAME label="" label.drawing=off background.drawing=off label.y_offset=$y_offset
        else
            sketchybar --set $NAME label="$APP_ICONS" label.drawing=on background.drawing=off label.y_offset=$y_offset
        fi
    fi
}

update_workspace_icon $1
