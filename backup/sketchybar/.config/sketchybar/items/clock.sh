#!/usr/bin/env bash

COLOR="$MAGENTA"

sketchybar --add item clock right \
	--set clock update_freq=1 \
	icon.padding_left=15 \
	icon.padding_right=10 \
	icon.color="$COLOR" \
	icon="" \
	label.color="$COLOR" \
	label.padding_right=10 \
	label.width=95 \
	align=center \
    padding_left=15 \
    padding_right=30 \
	background.height=25 \
	background.height=28 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=10 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/clock.sh"
