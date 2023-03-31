#!/bin/bash

# Check if the port number is provided
if [[ -z "$PORT_NAME" ]]; then
    # If no port number is provided, print an error message and exit
    echo "Please provide the port number to kill"
    exit 1
fi

# Find the process running on the port and kill it
echo "Killing process running on port $PORT_NAME"
if lsof -Pi :$PORT_NAME -sTCP:LISTEN -t >/dev/null ; then
    # If there is a process running on the specified port, kill it
    lsof -ti:$PORT_NAME | xargs kill -9
    echo "Processes on port $PORT_NAME have been killed"
else
    # If there is no process running on the specified port, print a message
    echo "No processes found running on port $PORT_NAME"
fi
