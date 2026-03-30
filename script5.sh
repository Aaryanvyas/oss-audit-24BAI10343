#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Aryan Vyas | Reg: 24BAI10343
# Course: Open Source Software | Chosen Software: Python

echo "========================================"
echo "   Open Source Manifesto Generator"
echo "========================================"
echo "Answer three questions to generate your personal manifesto."
echo ""

# --- Collect user input interactively using read ---
read -p "1. Name one open-source tool you use every day: " TOOL      # -p shows prompt inline
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM  # Store user's answer in FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD  # Store user's answer in BUILD

# --- Get current date and generate output filename ---
DATE=$(date '+%d %B %Y')          # Format date as: 30 March 2026
OUTPUT="manifesto_$(whoami).txt"  # Filename includes username, e.g. manifesto_aryan.txt

# --- Write manifesto to file using string concatenation and >> operator ---
echo "" > "$OUTPUT"                        # Create/overwrite file with empty line
echo "=== Open Source Manifesto ===" >> "$OUTPUT"   # >> appends without overwriting
echo "Generated on: $DATE" >> "$OUTPUT"             # Append date
echo "By: $(whoami)" >> "$OUTPUT"                   # Append current username
echo "" >> "$OUTPUT"
# Compose personalised paragraph using the three collected variables
echo "Every day, I use $TOOL — a tool built not for profit, but for people." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM, and open source is where that freedom lives." >> "$OUTPUT"
echo "One day, I will build $BUILD and share it freely with the world," >> "$OUTPUT"
echo "because the best ideas grow stronger when they are given away." >> "$OUTPUT"
echo "I stand on the shoulders of every developer who chose to share." >> "$OUTPUT"
echo "This is my commitment to that tradition." >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Note on aliases: You could add this to ~/.bashrc to create a shortcut:
# alias manifesto='bash ~/script5.sh'
# Aliases simplify repetitive commands by creating custom shorthand names.

echo "Manifesto saved to: $OUTPUT"
echo "========================================"
cat "$OUTPUT"   # Display the saved manifesto on screen using cat
