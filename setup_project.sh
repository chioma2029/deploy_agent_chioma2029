#!/usr/bin/env bash
# Project setup script for Attendance Tracker automation system

# Ask user for project name
read -p "Enter project name: " user_input

#created parent directory and then assiged it to a variable "$project"
project="attendance_tracker_${user_input}"

# Creating folder structure
mkdir -p "$project/Helpers"
mkdir -p "$project/reports"

# Moving existing source files into correct structure
mv attendance_checker.py "$project/"
mv assets.csv "$project/Helpers/"
mv config.json "$project/Helpers/"
mv reports.log "$project/reports/"

# Ask if user wants to update thresholds
read -p "Do you want to update thresholds? (yes/no): " choice

if [ "$choice" = "yes" ]; then

    # Get new values from user
    read -p "Enter warning threshold: " warning
    read -p "Enter failure threshold: " failure

    # Update config.json safely
    sed -i "s/\"warning\": [0-9]*/\"warning\": $warning/" "$project/Helpers/config.json"
    sed -i "s/\"failure\": [0-9]*/\"failure\": $failure/" "$project/Helpers/config.json"

else
    echo "Keeping default threshold values"
fi

# Check if Python3 is installed

if python3 --version > /dev/null 2>&1; then
    echo "Python3 is installed "
else
    echo "Warning: Python3 not found "
fi

# Handle Ctrl+C interruption

trap 'echo "Interrupted! Archiving project...";
tar -czf "${project}_archive.tar.gz" "$project";
rm -rf "$project";
exit' SIGINT



