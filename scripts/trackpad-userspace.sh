#!/bin/bash

# A script to set 'xinput' values when the trackpad breaks
# 0 = off; 1 = on

# Dynamically find the id of the trackpad in case it changes
id=$(xinput list | grep -o 'bcm5974.*id=[0-9]*' | cut -d'=' -f2)

notify-send "Trackpad Settings Set for $id"

# tapping
xinput --set-prop $id 315 1

# tap dragging
xinput --set-prop $id 317 1

# send safe events
sudo xinput --set-prop $id 301 0, 0

# tap dragging lock
xinput --set-prop $id 319 0

# tapping button mapping
xinput --set-prop $id 321 1, 0

# natural scrolling
xinput --set-prop $id 323 1

# disable while typing
xinput --set-prop $id 325 1

# scroll methods
sudo xinput --set-prop $id 328 1, 0, 0

# click method
sudo xinput --set-prop $id 331 0, 1

# middle click emulation
sudo xinput --set-prop $id 333 0

# acceleration speed
sudo xinput --set-prop $id 335 0.550000

# acceleration profile
sudo xinput --set-prop $id 338 1, 0, 0

# left hand
sudo xinput --set-prop $id 346 0

# allow horizontal scrolling
xinput --set-prop $id 349 1

# set the scroll speed 1 = very fast; 100 = very slow
sudo xinput --set-prop $id 350 50

# high resolution scroll
sudo xinput --set-prop $id 352 1

# start libinput-gestures gui and close gracefully with wmctrl
# gestures &
# sleep 2
# wmctrl -Fc Gestures
