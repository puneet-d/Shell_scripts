#!/bin/bash
# cvt 1366 768
#xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
#xrandr --addmode VGA-0 "1280x1024_60.00"
#xrandr --output VGA-0 --mode "1280x1024_60.00"

xrandr --newmode "1368x1024_60.00"  115.50  1368 1448 1592 1816  1024 1027 1037 1063 -hsync +vsync
xrandr --addmode VGA-0 "1368x1024_60.00"
xrandr --output VGA-0 --mode "1368x1024_60.00"


