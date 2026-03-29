#!/bin/bash
# Script 5: Open Source Manifesto Generator

echo "Answer three questions to generate your manifesto."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# Create manifesto
echo "On $DATE, I believe in the power of open source." > $OUTPUT
echo "I use $TOOL regularly, and for me freedom means $FREEDOM." >> $OUTPUT
echo "In the future, I would like to build and share $BUILD with the world." >> $OUTPUT
echo "Open source allows collaboration, learning, and innovation for everyone." >> $OUTPUT

echo ""
echo "Manifesto saved to $OUTPUT"
echo ""
cat $OUTPUT

