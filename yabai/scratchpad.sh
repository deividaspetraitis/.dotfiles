#!/bin/zsh

scratchpad_id=$(yabai -m query --windows | jq '.[] | select(.title=="neomutt").id')

if [[ "$scratchpad_id" -lt 1 ]]; then
	SKIP_TMUX=true /System/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal $(which neomutt) &
  	sleep 1 # delay until Terminal is launched and we can detect window id
	scratchpad_id=$(yabai -m query --windows | jq '.[] | select(.title=="neomutt").id')
  	yabai -m window --focus "$scratchpad_id"
  	yabai -m window --toggle float
  	yabai -m window --resize abs:1920:1080
  	yabai -m window --move abs:960:540
else
	is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '.["is-minimized"]')
  	current_space=$(yabai -m query --spaces --space | jq '.index')

  	if [[ "$is_minimized" == "true" ]]; then
  	  yabai -m window "$scratchpad_id" --space "$current_space"
  	  yabai -m window --focus "$scratchpad_id"
  	else
  	  yabai -m window "$scratchpad_id" --minimize
  	fi
fi
