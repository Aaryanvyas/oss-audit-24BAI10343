#!/bin/bash
# Script 4: Log File Analyzer
# Author: Aryan Vyas | Course: Open Source Software

LOGFILE=$1
KEYWORD=${2:-"error"}   # default = error
COUNT=0

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File not found."
    exit 1
fi

# Read file line by line
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

# Show last 5 matching lines
echo ""
echo "Last matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

