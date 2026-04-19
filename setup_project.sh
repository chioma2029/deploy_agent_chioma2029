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
[ -f "attendance_checker.py" ] && cp attendance_checker.py "$project/"
[ -f "assets.csv" ] && cp assets.csv "$project/Helpers/"
[ -f "config.json" ] && cp config.json "$project/Helpers/"
[ -f "reports.log" ] && cp reports.log "$project/reports/"

#Archiving and cleaning Interrupted project
trap 'echo "Interrupted! Archiving project..."; tar -czf "${project}_archive.tar.gz" "${project}";
rm -rf "$project"; exit' SIGINT

# Ask if user wants to update thresholds
read -p "Do you want to update thresholds? (yes/no): " choice

if [ "$choice" = "yes" ]; then
	config_file=$project/Helpers/config.json

    # Get new values from user
        read -p "Enter new warning threshold: " warning
        read -p "Enter new failure threshold: " failure

    # Update config.json safely
        if [ -f "$config_file" ]; then
		sed -i "s/\"warning\": [0-9]*/\"warning\": $warning/" "$config_file"
		sed -i "s/\"failure\": [0-9]*/\"failure\": $failure/" "$config_file"
        else
                echo "Config file not found, skipping update"
        fi
else
        echo "Keeping default threshold values"
fi       

# Check if Python3 is installed

if python3 --version > /dev/null 2>&1; then
    echo "Python3 is installed "
else
    echo "Warning: Python3 not found "
fi


