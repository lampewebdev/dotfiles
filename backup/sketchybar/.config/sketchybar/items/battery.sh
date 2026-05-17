#!/usr/bin/env bash

COLOR="$CYAN"

sketchybar --add item battery right \
	--set battery \
	update_freq=60 \
	icon.color="$COLOR" \
	icon.padding_left=15 \
	icon.padding_right=10 \
	label.padding_right=15 \
	label.color="$COLOR" \
    padding_left=15 \
	background.height=25 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=0 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/power.sh" \
	--subscribe battery power_source_change
