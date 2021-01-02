#!/bin/bash

# declares wallpaper directory
files=(/home/nathan/media/wallpapers/*)
#printf "%s\n" "${files[RANDOM % ${#files[@]}]}"

# sets a random file from wallpapers/ as bg on all 3 monitors, 
# and generates and assigns a theme from them 
feh --bg-fill $(printf "%s\n" "${files[RANDOM % ${#files[@]}]}") && flavours generate dark $(cat ~/.fehbg | tail -1 | cut -d "'" -f2) && flavours apply generated

# live refreshes the GTK theme in running apps
timeout 0.5s xsettingsd -c ~/.xsettings

# openbox refresh
openbox --reconfigure

# restart tint2
killall -SIGUSR1 tint2
