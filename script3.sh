#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Aryan Vyas | Reg: 24BAI10343
# Course: Open Source Software | Chosen Software: Python

# --- Array of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=============================="
echo "   Directory Audit Report"
echo "=============================="

# --- Loop through each directory using a for loop ---
for DIR in "${DIRS[@]}"; do   # "${DIRS[@]}" expands all array elements

    if [ -d "$DIR" ]; then    # -d checks if the path is an existing directory
        # ls -ld shows directory details; awk extracts permissions, owner, group (columns 1,3,4)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh gives human-readable size; 2>/dev/null hides permission errors; cut -f1 gets size only
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "$DIR => Permissions: $PERMS | Size: $SIZE"   # Print result for this directory
    else
        echo "$DIR does not exist on this system."  # Handle missing directories
    fi
done

echo "------------------------------"
echo "   Python Config Directory Check"
echo "------------------------------"

# --- Check Python-specific directories on the system ---
PYTHON_DIRS=("/usr/lib/python3" "/usr/bin/python3" "$HOME/.local/lib")

for PDIR in "${PYTHON_DIRS[@]}"; do   # Loop through Python-related paths
    if [ -e "$PDIR" ]; then           # -e checks if path exists (file or directory)
        PERMS=$(ls -ld "$PDIR" | awk '{print $1, $3, $4}')  # Get permissions and ownership
        echo "Found: $PDIR => $PERMS"
    else
        echo "Not found: $PDIR"   # Inform if Python path does not exist
    fi
done

echo "=============================="
