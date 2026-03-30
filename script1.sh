#!/bin/bash
# Script 1: System Identity Report
# Author: Aryan Vyas | Reg: 24BAI10343
# Course: Open Source Software | Chosen Software: Python

# --- Define student and software variables ---
STUDENT_NAME="Aryan Vyas"        # Store student name for display
SOFTWARE_CHOICE="Python"          # The open-source software chosen for audit

# --- Collect system info using command substitution $() ---
KERNEL=$(uname -r)                # uname -r returns the current Linux kernel version
USER_NAME=$(whoami)               # whoami returns the currently logged-in username
HOME_DIR=$HOME                    # $HOME is a built-in variable for the user's home directory
UPTIME=$(uptime -p)               # uptime -p gives a human-readable uptime like "up 2 hours"
DATE=$(date '+%d %B %Y, %H:%M')  # date with format string gives readable date and time
DISTRO=$(lsb_release -d | cut -f2) # lsb_release -d shows distro name; cut -f2 removes the label

# --- Print formatted output to terminal ---
echo "================================"
echo " Open Source Audit — $STUDENT_NAME"
echo "================================"
echo "Software : $SOFTWARE_CHOICE"   # Display chosen software
echo "Distro   : $DISTRO"            # Display Linux distribution name
echo "Kernel   : $KERNEL"            # Display kernel version
echo "User     : $USER_NAME"         # Display logged-in user
echo "Home     : $HOME_DIR"          # Display home directory path
echo "Uptime   : $UPTIME"            # Display how long system has been running
echo "Date     : $DATE"              # Display current date and time
echo "--------------------------------"
echo "License  : GNU/Linux is licensed under GPL v2"  # License info for the OS
echo "Note     : GPL ensures users can run, study, modify and share the software freely"
echo "================================"
