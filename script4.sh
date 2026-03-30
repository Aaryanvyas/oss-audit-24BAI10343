#!/bin/bash
# Script 4: Log File Analyzer
# Author: Aryan Vyas | Reg: 24BAI10343
# Course: Open Source Software | Chosen Software: Python
# Usage: ./script4.sh /var/log/syslog [keyword]

LOGFILE=$1              # First command-line argument: path to the log file
KEYWORD=${2:-"error"}   # Second argument: keyword to search; defaults to "error" if not provided
COUNT=0                 # Initialize match counter to zero

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then   # -z checks if the string is empty
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1   # Exit with error code 1
fi

# --- Check if the specified file exists ---
if [ ! -f "$LOGFILE" ]; then   # ! -f means "file does NOT exist"
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- If file is empty, retry with an alternate log file ---
if [ ! -s "$LOGFILE" ]; then   # ! -s means "file exists but is empty"
    echo "Warning: $LOGFILE is empty. Trying /var/log/dpkg.log instead..."
    LOGFILE="/var/log/dpkg.log"   # Switch to alternate log file
    if [ ! -f "$LOGFILE" ]; then
        echo "No usable log file found. Exiting."
        exit 1
    fi
fi

echo "Scanning: $LOGFILE for keyword: '$KEYWORD'"
echo "--------------------------------------------"

# --- Read log file line by line using while read loop ---
while IFS= read -r LINE; do        # IFS= prevents trimming whitespace; -r prevents backslash interpretation
    if echo "$LINE" | grep -iq "$KEYWORD"; then   # -i = case-insensitive, -q = quiet (no output)
        COUNT=$((COUNT + 1))   # Increment counter using arithmetic expansion
    fi
done < "$LOGFILE"   # Redirect file content into the while loop

# --- Display total match count ---
echo "Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Show last 5 matching lines for context ---
echo "Last 5 matching lines:"
echo "--------------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5   # grep finds matches; tail -5 shows last 5 lines
