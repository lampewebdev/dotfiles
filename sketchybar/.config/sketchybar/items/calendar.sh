#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar --add item calendar right \
	--set calendar update_freq=15 \
    icon.color="$COLOR" \
	icon.padding_left=15 \
	icon.padding_right=10 \
	label.color="$COLOR" \
	label.padding_right=15 \
    padding_left=15 \
	background.height=25 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=0 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/calendar.sh"
