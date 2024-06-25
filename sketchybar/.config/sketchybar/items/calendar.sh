#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar --add item calendar right \
	--set calendar update_freq=15 \
    icon.color="$BAR_COLOR" \
	icon.padding_left=15 \
	icon.padding_right=10 \
	label.color="$BAR_COLOR" \
	label.padding_right=15 \
	background.height=40 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=0 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$BAR_COLOR" \
	background.color="$COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/calendar.sh"
