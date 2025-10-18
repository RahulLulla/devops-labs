#!/bin/bash
log_file="nginx_access.log"
echo "Top 5 IP addresses with the most requests:"
cat "$log_file" | awk '{print $1}' | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

echo "Top 5 requested paths:"
# cat "$log_file" | sed 's/.*[GET,OPTIONS,POST,DELETE,HEAD,PATCH,PRI] \(.*\)* HTTP.*/\1/' | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
cat "$log_file" | sed 's/.*".* \(.*\)* HTTP.*/\1/' | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""


echo "Top 5 response status codes:"
cat $log_file | sed -E 's/.*" ([0-9]{3}).*/\1/' |  sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

echo "Top 5 user agents:"
cat "$log_file" | sed -E 's/.*" "([^"]+)".*/\1/'  | sort | uniq -c | sort -nr | head -5 | tr -s ' ' | awk '{first=$1; $1=""; print $0 " - " first " requests"}' | sed 's/^ //g'
echo ""