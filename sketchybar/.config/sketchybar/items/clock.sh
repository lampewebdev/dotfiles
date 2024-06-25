#!/usr/bin/env bash

COLOR="$MAGENTA"

sketchybar --add item clock right \
	--set clock update_freq=1 \
	icon.padding_left=15 \
	icon.padding_right=10 \
	icon.color="$BAR_COLOR" \
	icon="" \
	label.color="$BAR_COLOR" \
	label.padding_right=10 \
	label.width=78 \
	align=center \
	background.height=40 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=2 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$BAR_COLOR" \
	background.color="$COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/clock.sh"
