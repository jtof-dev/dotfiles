#!/bin/bash

input="$1"
inputMinusFive="$((input - 5))"

if [[ -n "$input" && "$input" =~ ^[0-9]+$ && "$input" -ge 6 && "$input" -le 100 ]]; then
    echo "$inputMinusFive" | sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold
    sleep 1
    echo "$input" | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
else
    echo "you entered '$input'. please enter a number between 6 and 100."
fi


