#!/bin/bash

# Detect number of monitors and set layout accordingly
MONITOR_COUNT=$(system_profiler SPDisplaysDataType | grep -c "Resolution:")

if [ "$MONITOR_COUNT" -gt 1 ]; then
    # Docked: use horizontal tiles
    /opt/homebrew/bin/aerospace layout tiles horizontal vertical
else
    # Laptop only: use accordion
    /opt/homebrew/bin/aerospace layout accordion vertical horizontal
fi
