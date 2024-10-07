#!/bin/bash

# A script to set 'xinput' values when the trackpad breaks
# 0 = off; 1 = on

# Dynamically find the id of the trackpad in case it changes
id=$(xinput list | grep -o 'ELAN06A1:00.*id=[0-9]*' | cut -d'=' -f2)

notify-send "Trackpad Settings Set for $id"

# Scroll methods
xinput --set-prop $id 314 1, 0, 0

# Scroll speed (set to 50)
xinput --set-prop $id 336 50

# High resolution scroll
xinput --set-prop $id 338 1

