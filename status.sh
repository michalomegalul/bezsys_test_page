#!/bin/sh
cd /var/www/html

{
echo "host:    $(hostname)"
echo "uptime:  $(uptime -p)"
echo "load:    $(cut -d' ' -f1-3 /proc/loadavg)"
echo "updated: $(date '+%Y-%m-%d %H:%M')"
} > status.txt

{
echo "failed logins: $(grep -c 'Failed password' /var/log/auth.log)"
echo
echo "top attackers:"
grep 'Failed password' /var/log/auth.log | grep -oE 'from [0-9.]+' | cut -d' ' -f2 | sort | uniq -c | sort -rn | head -5
} > attacks.txt
