#!/bin/bash

#This script will parse nginx log files,usually located in /var/log/nginx. It will parse both the normal and gzipped logs and then
# uniquely sort by count in reverse order.

# Set the awk command
awk_command='$9 == "200" && $7 ~ /^\/s\// {print $1, $7, $9, $11}'

# Use this for combined filters, searching for just 200 and 301 response codes, for example
# '$9 ~ /^30[1-3]$|^200$/ {{print $1, $7, $9, $11}' 

# Iterate over all access.log files sorted by timestamp
for file in $(ls -1t access.log*); do
  if [[ "${file##*.}" == "gz" ]]; then
    timestamp=$(zcat "$file" | head -n 1 | awk '{print $4, $5}')
    results=$(zcat "$file" | awk "$awk_command" | sort | uniq -c | sort -nr | head)
  else
    timestamp=$(head -n 1 "$file" | awk '{print $4, $5}')
    results=$(awk "$awk_command" "$file" | sort | uniq -c | sort -nr | head)
  fi
  echo "=== $file ($timestamp) ==="
  echo "Count | Requested URL | Response Code | Referrer URL"
  echo "$results"
done
