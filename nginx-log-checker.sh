#!/bin/bash

# Iterate over all access.log files sorted by timestamp
for file in $(ls -1t access.log*); do
  if [[ "${file##*.}" == "gz" ]]; then
    timestamp=$(zcat "$file" | head -n 1 | awk '{print $4, $5}')
    results=$(zcat "$file" | awk '$9 ~ /^30[1-3]$|^200$/ {print substr($7, 2), $8, $9, $11}' | sort | uniq -c | sort -nr | head)
  else
    timestamp=$(head -n 1 "$file" | awk '{print $4, $5}')
    results=$(awk '$9 ~ /^30[1-3]$|^200$/ {print substr($7, 2), $8, $9, $11}' "$file" | sort | uniq -c | sort -nr | head)
  fi
  echo "=== $file ($timestamp) ==="
  echo "Count | Requested URL | Response Code | Referrer URL | Redirect Target URL"
  echo "$results"
done