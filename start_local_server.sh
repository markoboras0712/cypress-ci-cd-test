#!/bin/bash

# Check if the server is already running
nc -z localhost 8888
if [ $? -eq 0 ]; then
  echo "Server is already running on port 8888"
  exit 0
fi

# Start the server
echo "Starting local server..."
npm run start &>/dev/null &

# Wait for the server to start
echo "Waiting for server to start..."
while ! nc -z localhost 8888; do   
  sleep 1 # wait for 1 second before checking again
done

echo "Server started successfully!"
