#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE="python3"

# Check if package is installed
if dpkg -l | grep -q $PACKAGE; then
    echo "$PACKAGE is installed."
    python3 --version
else
    echo "$PACKAGE is NOT installed."
fi

# Case statement
case $PACKAGE in
    python3) echo "Python: a powerful open-source programming language" ;;
    git) echo "Git: version control system for developers" ;;
    vlc) echo "VLC: open-source multimedia player" ;;
    firefox) echo "Firefox: open-source web browser" ;;
    *) echo "Unknown package" ;;
esac



