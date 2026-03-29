#!/bin/bash
# Script 3: Disk and Permission Auditor

# List of directories
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"

# Loop through directories
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld $DIR | awk '{print $1, $3, $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist"
    fi
done

# Check Python config directory
echo ""
if [ -d "/etc/python3" ]; then
    echo "Python config directory found:"
    ls -ld /etc/python3
else
    echo "Python config directory not found"
fi

