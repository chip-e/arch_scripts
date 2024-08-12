#!/usr/bin/bash
#set -euo pipefail
# A bash script for creating python virtual environment
# TODO:
# Check if user is sourcing the file
# How to jump into and activate directory venv without crashing

# Reminder for running with 'source'
echo 'Run with "source" or "."'
echo '  ex: "source ./pyvenv" or ". ./pyvenv"'

# takes user argument as directory name, defaults to "new_project" if no input
projectdir=${1:-new_project}

# Create project directory
echo "Creating $projectdir..."
mkdir $projectdir
# Create virtual environment within project directory
python -m venv $projectdir/env
echo "$projectdir created."

# Change to projectfolder
echo "Jumping into $projectdir directory..."
cd $projectdir/

# Activate venv
 echo "Activating virtual environment..."
source env/bin/activate
#venv_activate () {
#  . /env/bin/activate
#}
#venv_activate
echo "Activated."


# Reminder messages 
echo ""
echo "REMINDERS:"
echo "  * 'cd $projectdir' then 'source /env/bin/activate' to activate virtual environment."
echo "  * Use 'pip install package_name' to install pip pkgs"
echo "  * 'deactivate' to exit virtual environment"
echo ""
