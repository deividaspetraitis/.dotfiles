#!/bin/bash

# Note: in order to make this script to function properly first of all make arrangement of displays is the settings
# by setting the left most display as main display.

# TODO: on alt-l when alt-p enabled it unhides hidden window
current_display=$(yabai -m query --windows --window | jq '.display')
next_display=0
focus=""
display=""

case $1 in
  l)
	next_display=$(($current_display+1))
	focus="east"
	display="next"
    ;;

  h)
	next_display=$(($current_display-1))
	focus="west"
	display="prev"
    ;;

  *)
    echo "unknown direction $1"
	exit
    ;;
esac

#if [[ $next_display -eq "0" ]]; then
#	echo "can not find next display"
#	exit
#fi

# First yabai command retrieves a windows list for Display $next_display
# With the first jq command I am trying to filter out windows that are not in visible screen area, floating windows are omitted because I am unable to determine their relevance.
# With second jq command I am ordering all the windows by X axis so when I switch to the right screen I would start from most left window.
next_display_window=$(yabai -m query --windows --display $next_display | jq '.[] | select( (.level == 0) and ."is-visible" == true and ."is-floating" == false ) ' | jq -s -c 'sort_by(.frame.x) | .[] | .id' | head -n 1)

echo "next_display $next_display"
echo "next_display_window $next_display_window"
echo "focus $focus"

yabai -m window --focus $focus || yabai -m window --focus $next_display_window
