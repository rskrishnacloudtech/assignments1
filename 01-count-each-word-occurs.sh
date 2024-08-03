#!/bin/bash 

# Check if a file is provided as an argument 
if [ $# -ne 1 ]; then 
    echo "Usage: $0 <filename>" 
    exit 1 
fi 

# Check if the provided file exists 
if [ ! -f "$1" ]; then 
    echo "File $1 not found." 
    exit 1 
fi

# Use tr to convert all uppercase letters to lowercase, then use tr to convert all non-alphanumeric characters to newlines. 
# Use sort to sort the words alphabetically, then use uniq -c to count the occurrences of each unique word. 
# Use sort -nr to sort the output numerically and in reverse order (largest count first). 
# Use head -n 5 to get the top 5 most frequent words. 
# Finally, use awk to print the count and word separately. 
cat "$1" | tr '[:upper:]' '[:lower:]' | tr -sc '[:alnum:]' '\n' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $1 " " $2}'