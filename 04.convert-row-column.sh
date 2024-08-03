#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

input_file=$1
output_file=$2

# Transpose the input file using awk. NF - Number of fields (columns). NR - Number of rows.
awk '
{
  for (i=1; i<=NF; i++)  {
    matrix[NR,i] = $i
  }
  max_cols = (NF > max_cols ? NF : max_cols)
  max_rows = NR
}
END {
  for (i=1; i<=max_cols; i++) {
    for (j=1; j<=max_rows; j++) {
      printf("%s%s", matrix[j,i], (j==max_rows ? "" : " "))
    }
    print ""
  }
}
' "$input_file" > "$output_file"

echo "Transposition complete. Output written to $output_file"
