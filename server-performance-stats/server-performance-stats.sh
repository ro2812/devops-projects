#!/usr/bin/env bash

echo "Server Performance Stats"
echo
echo "CPU Usage"
top -l 1 | awk '/CPU usage/ {gsub("%","",$7); printf "Total CPU usage: %.2f%%\n", 100-$7}'

echo
echo "Memory Usage"
total=$(sysctl -n hw.memsize)
free=$(vm_stat | awk '/Pages free/ {gsub("\\.", "", $3); print $3*4096}')
used=$((total-free))
awk -v t="$total" -v u="$used" -v f="$free" 'BEGIN{printf "Total: %.2f GB\nUsed: %.2f GB (%.2f%%)\nFree: %.2f GB (%.2f%%)\n", t/1024/1024/1024, u/1024/1024/1024, u/t*100, f/1024/1024/1024, f/t*100}'

echo
echo "Disk Usage"
df -k / | awk 'NR==2{t=$2*1024;u=$3*1024;f=$4*1024;printf "Total: %.2f GB\nUsed: %.2f GB (%s)\nFree: %.2f GB\n", t/1024/1024/1024, u/1024/1024/1024, $5, f/1024/1024/1024}'

echo
echo "Top 5 Processes by CPU Usage"
ps -A -o pid,ppid,%cpu,%mem,comm | sort -k3 -nr | head -n 6

echo
echo "Top 5 Processes by Memory Usage"
ps -A -o pid,ppid,%cpu,%mem,comm | sort -k4 -nr | head -n 6
