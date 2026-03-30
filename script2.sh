#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Aryan Vyas | Reg: 24BAI10343
# Course: Open Source Software | Chosen Software: Python

PACKAGE="python3"   # Define the package name to inspect

# --- Check if the package is installed using dpkg ---
# dpkg -l lists installed packages; &>/dev/null suppresses output
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "$PACKAGE is installed on this system."

    # grep -E filters for lines matching Version or License or Summary
    dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "Version: "$3}'  # awk prints the 3rd column (version)
else
    echo "$PACKAGE is NOT installed."
    echo "Install it using: sudo apt install $PACKAGE"  # Suggest install command
fi

# --- Show Python version directly from the interpreter ---
if command -v python3 &>/dev/null; then          # command -v checks if python3 binary exists
    echo "Python Version: $(python3 --version)"  # Run python3 --version and capture output
fi

echo ""
echo "--- Open Source Philosophy Notes ---"

# --- case statement: print a philosophy note based on the package name ---
# case is used here instead of multiple if-else blocks for cleaner code
case $PACKAGE in
    python3)
        echo "Python: A language built on the belief that code should be readable by humans." ;;
    apache2 | httpd)
        echo "Apache: The web server that helped build the open internet." ;;
    mysql | mariadb)
        echo "MySQL: Open source at the heart of millions of web applications." ;;
    git)
        echo "Git: Born when proprietary version control failed the open source world." ;;
    vlc)
        echo "VLC: Built by students in Paris to stream video freely — now plays everything." ;;
    *)
        echo "$PACKAGE: An open-source tool contributing to a shared digital commons." ;;  # Default case
esac
