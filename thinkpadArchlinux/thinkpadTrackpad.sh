#!/bin/bash

id=$(xinput list | grep -o 'ELAN06A1:00.*id=[0-9]*' | cut -d'=' -f2)

# notify-send "Trackpad Settings Set for $id"

xinput --set-prop $id 340 50 # set scroll speed

