# thinkpadArchlinux

## battery

- I have experimented with various battery utilities, but none have consistently worked. I'm not sure if I changed something on my setup, but now the most consistent method to limiting charging is the following

- change the `charge_control_start_threshold` and `charge_control_start_threshold` to a 5% window to cap the charging window

- generally, I keep those at 75 and 80 respectively

- while within the charging cap, I am not sure what the behavior of the laptop is. however, it currently appears to only use ac power, letting the battery sit (I think!)
