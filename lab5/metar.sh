#!/bin/bash

echo "gathering data"
curl -sL "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=f$

times=$(jq -r '.[].receiptTime' data.json | head -n 6)
echo "$times"

temps=$(jq '.[].temp' data.json)
sum=0
#!/bin/bash

echo "gathering data"
curl -sL "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=f$

times=$(jq -r '.[].receiptTime' data.json | head -n 6)
echo "$times"

temps=$(jq '.[].temp' data.json)
