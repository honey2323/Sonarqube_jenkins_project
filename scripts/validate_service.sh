#!/bin/bash

echo "Waiting for the application to start..."
sleep 10  # Adjust delay based on your application's startup time

# Check if the application is running
if curl -f http://localhost:3000; then
    echo "Application is running."
else
    echo "Application failed to start."
    exit 1
fi
