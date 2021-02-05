#!/bin/bash

TARGET_BRIGHTNESS=160
BRIGHTNESS=$(v4l2-ctl -C brightness)

while [ "$BRIGHTNESS" != "brightness: $TARGET_BRIGHTNESS" ]
do
v4l2-ctl -c brightness=$TARGET_BRIGHTNESS,contrast=32,saturation=70,\
hue=9,white_balance_temperature_auto=1,gamma=120,\
gain=4,power_line_frequency=2,white_balance_temperature=4000f,\
sharpness=5,backlight_compensation=0,exposure_auto=3,\
exposure_absolute=156,exposure_auto_priority=1

  sleep 2

  BRIGHTNESS=$(v4l2-ctl -C brightness)
done


