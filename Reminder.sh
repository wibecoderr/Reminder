#!/bin/bash
if ! command -v notify-send &> /dev/null; then
    echo "Error: notify-send is not installed. Install libnotify-bin package."
    exit 1
fi
echo "Enter Date for which you want reminder to pop up in (YYYY-MM-DD)"
read date 
echo "Enter time you want to set for pop-up "
read time 
echo "Enter reminder message "
read message 
datetime="$date $time:00"

systemd-run --user --on-calendar="$datetime" sh -c "
notify-send -u critical -t 10000 'Reminder' '$message';
timeout 5s paplay --volume=65536 /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
"


echo "Reminder set  congratulation !!!!!!!"

