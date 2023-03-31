#!/bin/bash


# Check if the port number is provided
if [[ -z "$1" ]]; then
    echo "Please provide the port number to kill"
    exit 1
fi

# Find the process running on the port and kill it
echo "Killing process running on port $1"
if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null ; then
    lsof -ti:$1 | xargs kill -9
    echo "Processes on port $1 have been killed"
else
    echo "No processes found running on port $1"
fi
