#!/bin/bash 

# Getting the top 5 CPU usage.
cpuusage=$(ps aux | sort -nrk 3,3 | head -n 5) 

# Getting the process name from the result.
processname=$(ps aux | sort -nrk 3,3 | head -n 5 | awk -F " " '{print $1f}') 
threshold=10 

# Reading all the records line by line and and cheking the usage is greater than threshold limit set and priting the process name which is more.
while IFS= read -r line 
do 
    usage=$($line | awk -F " " '{print $4f}')
    processname=$($line | awk -F " " '{print $1f}')
    if [ $usage -gt $threshold ]
    then
        echo "$processname is consuming more CPU memory than $threshold. Current uage is $usage" 
    fi
done <<< $cpuusage 