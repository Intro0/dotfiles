#!/usr/bin/env bash

# Adapted for aerospace (from hyprspace)

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

update_workspace_icon() {
    local workspace_id=$1

    # If NAME is not set by sketchybar (e.g., called directly), derive it from workspace_id
    local item_name="${NAME:-space.$workspace_id}"

    # Get all apps in this workspace
    local APP_ICONS=$(aerospace list-windows --workspace $workspace_id --format '%{app-name}' 2>/dev/null |
        while read -r app_name; do
            $CONFIG_DIR/plugins/icon_map_fn.sh "$app_name"
        done | tr '\n' ' ')

    # Trim whitespace
    APP_ICONS=$(echo "$APP_ICONS" | xargs)

    # Use -1 offset for all (works for most apps, Warp will be slightly off)
    local y_offset=-1

    if [ "$workspace_id" == "$FOCUSED_WORKSPACE" ]; then
        if [ -z "$APP_ICONS" ]; then
            # Empty workspace - just show the workspace name, no label
            sketchybar --set $item_name label="" label.drawing=off background.drawing=on label.y_offset=$y_offset
        else
            # Has apps - show the icons
            sketchybar --set $item_name label="$APP_ICONS" label.drawing=on background.drawing=on label.y_offset=$y_offset
        fi
    else
        if [ -z "$APP_ICONS" ]; then
            sketchybar --set $item_name label="" label.drawing=off background.drawing=off label.y_offset=$y_offset
        else
            sketchybar --set $item_name label="$APP_ICONS" label.drawing=on background.drawing=off label.y_offset=$y_offset
        fi
    fi
}

update_workspace_icon $1
