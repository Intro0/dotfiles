#!/usr/bin/env bash

function icon_map() {
  case "$1" in
  "Akiflow") icon_result=":default:"; y_offset=-1 ;;
  "Discord" | "Discord Canary" | "Discord PTB") icon_result=":discord:"; y_offset=-1 ;;
  "Finder") icon_result=":finder:"; y_offset=-1 ;;
  "Spotify") icon_result=":spotify:"; y_offset=-1 ;;
  "Vivaldi") icon_result=":vivaldi:"; y_offset=-1 ;;
  "Warp") icon_result=":warp:"; y_offset=1 ;;
  "Zed") icon_result=":zed:"; y_offset=-1 ;;
  "Arc") icon_result=":arc:"; y_offset=-1 ;;
  "Code" | "Code - Insiders" | "Cursor") icon_result=":code:"; y_offset=-1 ;;
  "Safari") icon_result=":safari:"; y_offset=-1 ;;
  "Google Chrome" | "Chromium") icon_result=":google_chrome:"; y_offset=-1 ;;
  "Terminal") icon_result=":terminal:"; y_offset=-1 ;;
  "iTerm" | "iTerm2") icon_result=":iterm:"; y_offset=-1 ;;
  "Slack") icon_result=":slack:"; y_offset=-1 ;;
  "Messages") icon_result=":messages:"; y_offset=-1 ;;
  "Mail" | "Spark" | "Superhuman") icon_result=":mail:"; y_offset=-1 ;;
  "Notes") icon_result=":notes:"; y_offset=-1 ;;
  "Notion") icon_result=":notion:"; y_offset=-1 ;;
  "Obsidian") icon_result=":obsidian:"; y_offset=-1 ;;
  "Calendar" | "Fantastical" | "Notion Calendar") icon_result=":calendar:"; y_offset=-1 ;;
  "Music") icon_result=":music:"; y_offset=-1 ;;
  "System Preferences" | "System Settings") icon_result=":gear:"; y_offset=-1 ;;
  *) icon_result=":default:"; y_offset=-1 ;;
  esac
}

icon_map "$1"

if [ "$2" == "offset" ]; then
  echo "$y_offset"
else
  echo "$icon_result"
fi
