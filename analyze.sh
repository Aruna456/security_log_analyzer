#!/bin/bash

#check if argument is provided
if [ "$#" -ne 1 ]; then
 echo "Usage: $0 <log_file>"
 exit 2
fi

LOG_FILE="$1"
REPORT_FILE="report.txt"

#check if file exists
if [ ! -f "$LOG_FILE" ]; then
 echo "Error: File '$LOG_FILE' not found"
 exit 3
fi

TOTAL_LINE=$(wc -l < "$LOG_FILE")
ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")
INFO_COUNT=$(grep -c "INFO" "$LOG_FILE")

{
echo "Log Analysis Report"
echo "-------------------"
echo "Total Lines: $TOTAL_LINE"
echo "Error Count: $ERROR_COUNT"
echo "Info Count: $INFO_COUNT"
echo "Generated at: $(date)"
} > "$REPORT_FILE"

if [ "$ERROR_COUNT" -gt 0 ]; then
  exit 1
else
  exit 0
fi


