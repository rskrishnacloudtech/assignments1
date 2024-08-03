#!/bin/bash

# Set the CPU usage threshold
THRESHOLD=80

# Get the top 5 CPU consuming processes
TOP_PROCESSES=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6)

# Display the top 5 CPU consuming processes
echo "Top 5 CPU consuming processes:"
echo "$TOP_PROCESSES"

# Check if any process exceeds the CPU usage threshold
ALERT=$(echo "$TOP_PROCESSES" | awk -v threshold=$THRESHOLD 'NR>1 && $5+0 > threshold {print}')

if [ -n "$ALERT" ]; then
    echo "ALERT: Some processes are consuming more than $THRESHOLD% CPU:"
    echo "$ALERT"
    # You can add additional actions here, like sending an email or notification
fi