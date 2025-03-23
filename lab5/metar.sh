#!/bin/bash
curl -sL "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=f$
times=$(jq -r '.[].receiptTime' data.json | head -n 6)
echo "$times"
temps=$(jq '.[].temp' data.json)
sum=0
count=0
for temp in $temps; do
  sum=$(echo "$sum + $temp" | bc)
  count=$((count + 1))
done
avg_temp=$(echo "scale=2; $sum / $count" | bc)
echo "Average Temperature: $avg_temp"
clouds=$(jq -r '.[].clouds' data.json | grep -v "CLR" | wc -l)
cloudy=false
if [ "$clouds" -gt 6 ]; then
  cloudy=true
fi
echo "Mostly Cloudy: $cloudy"

