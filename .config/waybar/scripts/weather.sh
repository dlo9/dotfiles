#!/bin/bash
# Format options: https://github.com/chubin/wttr.in

LOCATION="$1"
WEATHER="$(curl -s "wttr.in/$LOCATION?format=%l|%c|%C|%t|%f|%w")"
LOCATION=$(echo "$WEATHER" | awk -F '|' '{print $1}' | sed 's/,/, /g')
ICON=$(echo "$WEATHER" | awk -F '|' '{print $2}')
DESCRIPTION=$(echo "$WEATHER" | awk -F '|' '{print $3}')
TEMP=$(echo "$WEATHER" | awk -F '|' '{print $4}')
FEELS_LIKE=$(echo "$WEATHER" | awk -F '|' '{print $5}')
WIND=$(echo "$WEATHER" | awk -F '|' '{print $6}')

printf '{"text":"%s %s", "tooltip":"%s: %s, %s, %s", "class":"", "percentage":""}' "$FEELS_LIKE" "$ICON" "$LOCATION" "$DESCRIPTION" "$TEMP" "$WIND"
